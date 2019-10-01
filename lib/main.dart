import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/app.dart';
import 'package:async_redux_boilerplate/global_keys.dart';
import 'package:async_redux_boilerplate/store/store.dart';
import 'package:flutter/material.dart';

void main() {
  final store = createStore();
  NavigateAction.setNavigatorKey(navigatorKey);

  runApp(App(store: store));
}
