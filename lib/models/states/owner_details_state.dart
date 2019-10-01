import 'package:async_redux_boilerplate/models/github/owner_details_result.dart';
import 'package:meta/meta.dart';

@immutable
class OwnerDetailsState {
  OwnerDetailsState({
    @required this.data,
    @required this.error,
    @required this.isLoading,
  });

  final OwnerDetailsResult data;
  final String error;
  final bool isLoading;

  factory OwnerDetailsState.initial() {
    return OwnerDetailsState(
      data: OwnerDetailsResult(),
      error: null,
      isLoading: false,
    );
  }

  OwnerDetailsState copyWith({
    OwnerDetailsResult data,
    String error,
    bool isLoading,
  }) {
    return OwnerDetailsState(
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerDetailsState &&
          runtimeType == other.runtimeType &&
          data == other.data &&
          error == other.error &&
          isLoading == other.isLoading;

  @override
  int get hashCode => data.hashCode ^ error.hashCode ^ isLoading.hashCode;
}
