part of 'delete_bloc.dart';

@freezed
class DeleteEvent with _$DeleteEvent {
  const factory DeleteEvent.deleted({required Uid id}) = _Deleted;
}