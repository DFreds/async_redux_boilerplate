import 'package:async_redux_boilerplate/models/github/github_repo_result.dart';
import 'package:meta/meta.dart';

@immutable
class RepoState {
  RepoState({
    @required this.currentPage,
    @required this.data,
    @required this.error,
    @required this.isLoading,
    @required this.query,
  });

  final int currentPage;
  final GithubRepoResult data;
  final String error;
  final bool isLoading;
  final String query;

  factory RepoState.initial() {
    return RepoState(
      currentPage: 1,
      data: GithubRepoResult.initial(),
      error: null,
      isLoading: false,
      query: "",
    );
  }

  RepoState copyWith({
    GithubRepoResult data,
    String error,
    String query,
    bool isLoading,
    int currentPage,
  }) {
    return RepoState(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      query: query ?? this.query,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepoState &&
          runtimeType == other.runtimeType &&
          currentPage == other.currentPage &&
          data == other.data &&
          error == other.error &&
          isLoading == other.isLoading &&
          query == other.query;

  @override
  int get hashCode => currentPage.hashCode ^ data.hashCode ^ error.hashCode ^ isLoading.hashCode ^ query.hashCode;
}
