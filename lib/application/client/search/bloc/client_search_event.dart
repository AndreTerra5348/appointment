part of 'client_search_bloc.dart';

@freezed
class ClientSearchEvent with _$ClientSearchEvent {
  const factory ClientSearchEvent.fetchRequested() = _FetchRequested;
  const factory ClientSearchEvent.termChanged({required String term}) =
      _TermChanged;
  const factory ClientSearchEvent.refreshRequested() = _RefreshRequested;
}