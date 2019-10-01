import 'package:async_redux_boilerplate/models/github/owner.dart';

/// This is an individual repo information.
///
/// See this link for an example: [https://api.github.com/search/repositories?q=python&sort=stars]
class Repo {
  Repo({
    this.name,
    this.owner,
    this.stars,
  });

  final String name;
  final Owner owner;
  final int stars;

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      name: json['name'],
      owner: Owner.fromJson(json['owner']),
      stars: json['stargazers_count'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Repo &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          owner == other.owner &&
          stars == other.stars;

  @override
  int get hashCode => name.hashCode ^ owner.hashCode ^ stars.hashCode;
}
