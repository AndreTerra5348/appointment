/// Defines [DetailsNameInputWidget]
import 'package:appointment/application/client/bloc/client_bloc.dart';
import 'package:appointment/presentation/client/common/widgets/client_name_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Editable [NameFormField] for [Client] [Name]
class DetailsNameInputWidget extends StatelessWidget {
  /// Enables editing
  final bool isEditing;
  const DetailsNameInputWidget({
    super.key,
    this.isEditing = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientBloc, ClientState>(
      builder: (context, state) {
        return NameFormField(
          key: isEditing ? null : Key(state.nameOrEmpty),
          initialValue: state.nameOrNull,
          enabled: isEditing,
          context: context,
        );
      },
    );
  }
}

/// Shortcuts for reading [ClientState] properties
extension on ClientState {
  String? get nameOrNull => client.name.value.fold(
        (_) => null,
        (value) => value,
      );
  String get nameOrEmpty => client.name.value.fold(
        (_) => "",
        (value) => value,
      );
}
