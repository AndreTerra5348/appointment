import 'package:appointment/application/client/bloc/client_bloc.dart';
import 'package:appointment/application/details/bloc/details_bloc.dart';
import 'package:appointment/application/delete/bloc/delete_bloc.dart';
import 'package:appointment/application/edit/bloc/edit_bloc.dart';
import 'package:appointment/application/load/bloc/load_bloc.dart';
import 'package:appointment/domain/client/client_entity.dart';
import 'package:appointment/domain/common/common_values.dart';
import 'package:appointment/presentation/client/details/widgets/client_details_form.dart';
import 'package:appointment/presentation/common/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class ClientDetailsPageScaffold extends StatelessWidget {
  const ClientDetailsPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc<Client>, DetailsState<Client>>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.tr.pageClientDetailsTitle(context.clientNameOrEmpty),
            ),
            actions: _buildActions(
              context,
              context.isEditing,
            ),
          ),
          body: const ClientDetailsFormWidget(),
        );
      },
    );
  }

  List<Widget> _buildActions(BuildContext context, bool isEditing) {
    return isEditing
        ? [
            IconButton(
              icon: const Icon(Icons.save_outlined),
              onPressed: context.editBloc.state.isInProgress
                  ? null
                  : () => _showSaveConfirmationDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: context.editBloc.state.isInProgress
                  ? null
                  : () => _showStopEditingConfirmationDialog(context),
            ),
          ]
        : [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: context.editPressed,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outlined),
              onPressed: () => _showDeleteConfirmationDialog(context),
            ),
          ];
  }

  _showStopEditingConfirmationDialog(BuildContext context) {
    Dialogs.materialDialog(
      dialogWidth: 0.1,
      context: context,
      msg: context.tr.stopEditingConfirmation,
      actions: [
        CancelIconsButton(context: context, text: context.tr.no),
        IconsButton(
          onPressed: () {
            Navigator.pop(context);
            context.cancelPressed();
            context.reaload(id: context.client.id);
          },
          text: context.tr.yes,
          iconData: Icons.cancel,
        ),
      ],
    );
  }

  _showSaveConfirmationDialog(BuildContext context) {
    Dialogs.materialDialog(
      dialogWidth: 0.1,
      context: context,
      msg: context.tr.saveConfirmation,
      actions: [
        CancelIconsButton(context: context),
        IconsButton(
          onPressed: () {
            Navigator.pop(context);
            context.savePressed(client: context.client);
          },
          text: context.tr.save,
          iconData: Icons.save,
        ),
      ],
    );
  }

  _showDeleteConfirmationDialog(BuildContext context) {
    Dialogs.materialDialog(
      dialogWidth: 0.1,
      context: context,
      msg: context.tr.deleteConfirmation(
        context.client.name.getOrThrow(),
      ),
      actions: [
        CancelIconsButton(context: context),
        IconsButton(
          onPressed: () {
            Navigator.pop(context);
            context.deleted(id: context.client.id);
          },
          text: context.tr.delete,
          iconData: Icons.delete,
        ),
      ],
    );
  }
}

class CancelIconsButton extends IconsButton {
  CancelIconsButton({required BuildContext context, String? text})
      : super(
          onPressed: () => Navigator.pop(context),
          text: text ?? context.tr.cancel,
          iconData: Icons.cancel,
        );
}

extension on BuildContext {
  LoadBloc<Client> get detailsBloc => BlocProvider.of<LoadBloc<Client>>(this);

  EditBloc<Client> get editBloc => BlocProvider.of<EditBloc<Client>>(this);

  ClientBloc get clientBloc => BlocProvider.of<ClientBloc>(this);

  DeleteBloc<Client> get deleteBloc =>
      BlocProvider.of<DeleteBloc<Client>>(this);

  bool get isEditing => editBloc.state.isEditing;

  Client get client => clientBloc.state.client;

  String get clientNameOrEmpty => client.name.value.getOrElse(() => "");

  void reaload({required Uid id}) => detailsBloc.add(LoadEvent.loaded(id: id));

  void editPressed() => editBloc.add(const EditEvent.editPressed());

  void cancelPressed() => editBloc.add(const EditEvent.cancelPressed());

  void savePressed({required Client client}) =>
      editBloc.add(EditEvent.savePressed(entity: client));

  void deleted({required Uid id}) =>
      deleteBloc.add(DeleteEvent.deleted(id: id));
}