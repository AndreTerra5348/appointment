import 'package:appointment/domain/client/client_values.dart';
import 'package:appointment/domain/common/value_object.dart';
import 'package:appointment/domain/common/common_values.dart';
import 'package:appointment/domain/common/entity_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_entity.freezed.dart';

@freezed
abstract class Client with _$Client, EntityMixin {
  const Client._();

  const factory Client({required Name name, required Uid id}) = _Client;

  factory Client.withoutUid({required Name name}) =>
      Client(name: name, id: Uid());

  @override
  List<ValueObject<dynamic, dynamic>> get values => [name, id];
}