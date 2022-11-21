import 'package:appointment/app_ointment.dart';
import 'package:appointment/application/client/search/bloc/bloc.dart';
import 'package:flutter/material.dart';

class ClientSearchBarWidget extends StatelessWidget {
  final ClientSearchBloc bloc;
  const ClientSearchBarWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: context.tr.searchTextFormFieldHint,
      ),
      onChanged: (value) => bloc.add(
        ClientSearchEvent.termChanged(term: value),
      ),
    );
  }
}