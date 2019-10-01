import 'package:async_redux_boilerplate/models/states/owner_details_state.dart';
import 'package:async_redux_boilerplate/models/states/repo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({
    @required this.ownerDetailsState,
    @required this.repoState,
  });

  final OwnerDetailsState ownerDetailsState;
  final RepoState repoState;

  factory AppState.initial() {
    return AppState(
      ownerDetailsState: OwnerDetailsState.initial(),
      repoState: RepoState.initial(),
    );
  }

  AppState copyWith({
    OwnerDetailsState ownerDetailsState,
    RepoState repoState,
  }) {
    return AppState(
      ownerDetailsState: ownerDetailsState ?? this.ownerDetailsState,
      repoState: repoState ?? this.repoState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && ownerDetailsState == other.ownerDetailsState && repoState == other.repoState;

  @override
  int get hashCode => ownerDetailsState.hashCode ^ repoState.hashCode;
}
