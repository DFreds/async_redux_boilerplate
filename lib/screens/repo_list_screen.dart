import 'package:async_redux_boilerplate/connectors/repo_list.dart';
import 'package:async_redux_boilerplate/connectors/search_field.dart';
import 'package:async_redux_boilerplate/connectors/total_results_text.dart';
import 'package:flutter/material.dart';

class RepoListScreen extends StatelessWidget {
  RepoListScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aync Redux"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SearchField(),
            TotalResultsText(),
            Expanded(child: RepoList()),
          ],
        ),
      ),
    );
  }
}
