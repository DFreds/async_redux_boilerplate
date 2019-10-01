import 'package:async_redux_boilerplate/models/github/github_repo_result.dart';
import 'package:async_redux_boilerplate/models/github/owner_details_result.dart';
import 'package:async_redux_boilerplate/services/github_web_client.dart';

final GithubRepository repository = const GithubRepository();

class GithubRepository {
  final GithubWebClient githubWebClient;

  const GithubRepository({
    this.githubWebClient = const GithubWebClient(),
  });

  Future<GithubRepoResult> loadRepoResult(String query) async {
    return await githubWebClient.fetchRepoResult(query);
  }

  Future<OwnerDetailsResult> loadOwnerDetails(String owner) async {
    return await githubWebClient.fetchOwnerDetails(owner);
  }
}
