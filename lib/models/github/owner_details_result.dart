class OwnerDetailsResult {
  OwnerDetailsResult({
    this.followers,
    this.following,
    this.location,
    this.login,
    this.name,
    this.publicRepos,
  });

  final int followers;
  final int following;
  final String location;
  final String login;
  final String name;
  final int publicRepos;

  factory OwnerDetailsResult.fromJson(Map<String, dynamic> json) {
    return OwnerDetailsResult(
      followers: json['followers'],
      following: json['following'],
      location: json['location'],
      login: json['login'],
      name: json['name'],
      publicRepos: json['public_repos'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerDetailsResult &&
          runtimeType == other.runtimeType &&
          followers == other.followers &&
          following == other.following &&
          location == other.location &&
          login == other.login &&
          name == other.name &&
          publicRepos == other.publicRepos;

  @override
  int get hashCode =>
      followers.hashCode ^
      following.hashCode ^
      location.hashCode ^
      login.hashCode ^
      name.hashCode ^
      publicRepos.hashCode;
}
