import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/global_keys.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';
import 'package:async_redux_boilerplate/screens/owner_details_screen.dart';
import 'package:async_redux_boilerplate/screens/repo_list_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({
    @required this.store,
  });

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      child: MaterialApp(
        initialRoute: "/",
        navigatorKey: navigatorKey,
        routes: {
          "/": (BuildContext context) => RepoListScreen(),
          "/ownerDetails": (BuildContext context) => OwnerDetailsScreen(),
        },
      ),
      store: store,
    );
  }
}
