import 'package:appointment/application/common/form.dart';
import 'package:appointment/presentation/common/build_context_extensions.dart';
import 'package:flutter/material.dart';

extension SubmissionFailureEx on SubmissionFailure {
  String toErrorText(BuildContext context) {
    return map(
      repository: (value) => context.tr.databaseFailure(
        value.failure.map(
          dbException: (value) => value.error.toString(),
        ),
      ),
      invalidFields: (value) => context.tr.invalidFieldsFailure,
      notFound: (value) => context.tr.notFoundFailure,
    );
  }
}
