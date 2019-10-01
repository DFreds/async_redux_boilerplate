import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/actions/actions.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      model: _ViewModel(),
      builder: (BuildContext context, _ViewModel vm) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Query",
            ),
            onChanged: vm.onQueryChanged,
          ),
        );
      },
    );
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  Function(String) onQueryChanged;

  _ViewModel.build({
    @required this.onQueryChanged,
  }) : super(equals: []);

  @override
  _ViewModel fromStore() => _ViewModel.build(
        onQueryChanged: (query) => dispatch(QueryChangedAction(query: query)),
      );
}
