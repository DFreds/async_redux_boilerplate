import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    actionObservers: [Log.printer(formatter: Log.verySimpleFormatter)],
    initialState: AppState.initial(),
  );
}
