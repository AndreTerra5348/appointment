import 'dart:async';

import 'package:appointment/application/client/bloc/bloc.dart';
import 'package:appointment/application/client/details/bloc/bloc.dart';
import 'package:appointment/application/common/form.dart';
import 'package:appointment/application/delete/bloc/bloc.dart';
import 'package:appointment/application/edit/bloc/bloc.dart';
import 'package:appointment/application/load/bloc/bloc.dart';
import 'package:appointment/domain/client/entity.dart';
import 'package:appointment/domain/common/values.dart';
import 'package:appointment/presentation/client/common/widgets/name_input.dart';
import 'package:appointment/presentation/common/failure_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientDetailsFormWidget extends StatefulWidget {
  const ClientDetailsFormWidget({super.key});

  @override
  State<ClientDetailsFormWidget> createState() =>
      _ClientDetailsFormWidgetState();
}

class _ClientDetailsFormWidgetState extends State<ClientDetailsFormWidget> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
      listenWhen: (previous, current) => current.maybeMap(
        orElse: () => false,
        load: (load) => load.state.isSuccess,
        edit: (value) => value.state.isSuccess || value.state.isFailure,
        delete: (value) => value.state.isSuccess || value.state.isFailure,
      ),
      listener: (context, state) {
        state.map(
          initial: (_) {},
          load: (load) => _handleDetailsStateChanged(load.state),
          edit: (edit) => _handleEditStateChanged(context, edit.state),
          delete: (delete) => _handleDeleteStateChanged(context, delete.state),
        );
      },
      builder: (context, state) {
        return Form(
          child: Stack(
            children: [
              Column(
                children: [
                  NameInputWidget(
                    isEditing: context.isEditing,
                  ),
                ],
              ),
              if (_isLoadingOrInProgress(state))
                const CircularProgressIndicator(value: null)
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    context.loadBloc.stream.listen(
      (state) => context.detailsBloc.add(
        DetailsEvent.loadEmited(state: state),
      ),
    );

    context.editBloc.stream.listen(
      (state) => context.detailsBloc.add(
        DetailsEvent.editEmited(state: state),
      ),
    );

    context.deleteBloc.stream.listen(
      (state) => context.detailsBloc.add(
        DetailsEvent.deleteEmited(state: state),
      ),
    );
  }

  _handleDeleteStateChanged(BuildContext context, DeleteState state) {
    state.maybeMap(
      orElse: () {},
      success: (_) => _handleSuccess(context),
      failure: (failure) => _handleFailure(
        context,
        failure.failure,
      ),
    );
    _timer = Timer(
      const Duration(seconds: 1),
      () {
        Navigator.pop(context);
        if (state.isSuccess) {
          context.router.pop();
        }
      },
    );
  }

  _handleDetailsStateChanged(LoadState<Client> state) {
    state.maybeMap(
      orElse: () {},
      success: (success) => context.load(
        client: success.entity,
      ),
    );
  }

  _handleEditStateChanged(BuildContext context, EditState state) {
    state.maybeMap(
      orElse: () {},
      success: (_) => _handleSuccess(context),
      failure: (failure) => _handleFailure(
        context,
        failure.failure,
      ),
    );

    _timer = Timer(
      const Duration(seconds: 1),
      () => Navigator.pop(context),
    );
  }

  _handleFailure(BuildContext context, SubmissionFailure failure) {
    showDialog(
      context: context,
      builder: (_) => Column(
        children: [
          const Icon(Icons.error_outline),
          Text(failure.toErrorText(context)),
        ],
      ),
    );
  }

  _handleSuccess(BuildContext context) {
    context.reaload(id: context.client.id);
    showDialog(
      context: context,
      builder: (_) => const Icon(Icons.check_circle_outline),
    );
  }

  bool _isLoadingOrInProgress(DetailsState state) {
    return state.maybeMap(
      orElse: () => false,
      load: (load) => load.state.isLoading,
      edit: (edit) => edit.state.isInProgress,
      delete: (delete) => delete.state.isInProgress,
    );
  }
}

extension on BuildContext {
  Client get client => clientBloc.state.client;

  ClientBloc get clientBloc => BlocProvider.of<ClientBloc>(this);
  DetailsBloc get detailsBloc => BlocProvider.of<DetailsBloc>(this);
  DeleteBloc<Client> get deleteBloc =>
      BlocProvider.of<DeleteBloc<Client>>(this);
  LoadBloc<Client> get loadBloc => BlocProvider.of<LoadBloc<Client>>(this);
  EditBloc<Client> get editBloc => BlocProvider.of<EditBloc<Client>>(this);

  bool get isEditing => editBloc.state.isEditing;

  void load({required Client client}) =>
      clientBloc.add(ClientEvent.loaded(client: client));

  void reaload({required Uid id}) => loadBloc.add(LoadEvent.loaded(id: id));
}
