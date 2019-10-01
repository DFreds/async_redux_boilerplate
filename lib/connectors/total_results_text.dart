import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';
import 'package:flutter/material.dart';

class TotalResultsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      model: _ViewModel(),
      builder: (BuildContext context, _ViewModel vm) {
        return Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text("${vm.totalResults} results"),
        );
      },
    );
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  int totalResults;

  _ViewModel.build({
    @required this.totalResults,
  }) : super(equals: [totalResults]);

  @override
  _ViewModel fromStore() => _ViewModel.build(
        totalResults: state.repoState.data.totalCount,
      );
}
