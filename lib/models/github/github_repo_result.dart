import 'package:async_redux_boilerplate/models/github/repo.dart';

class GithubRepoResult {
  GithubRepoResult({
    this.items,
    this.totalCount,
  });

  final List<Repo> items;
  final int totalCount;

  factory GithubRepoResult.initial() {
    return GithubRepoResult(
      items: [],
      totalCount: 0,
    );
  }

  factory GithubRepoResult.fromJson(Map<String, dynamic> json) {
    return GithubRepoResult(
      items: (json['items'] as List).map((repo) {
        return Repo.fromJson(repo);
      }).toList(),
      totalCount: json['total_count'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubRepoResult &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          totalCount == other.totalCount;

  @override
  int get hashCode => items.hashCode ^ totalCount.hashCode;
}
