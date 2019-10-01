import 'package:async_redux_boilerplate/models/github/repo.dart';
import 'package:flutter/material.dart';

class RepoListTile extends StatelessWidget {
  final Function(String) onTap;
  final Repo repo;

  const RepoListTile({
    Key key,
    @required this.onTap,
    @required this.repo,
  })  : assert(repo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(repo.owner.login),
      subtitle: Text(repo.owner.login),
      title: Text(
        repo.name,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: _createTrailing(),
    );
  }

  Row _createTrailing() {
    return Row(
      children: <Widget>[
        Text(repo.stars.toString()),
        const SizedBox(width: 4),
        Icon(Icons.star),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
    );
  }
}
