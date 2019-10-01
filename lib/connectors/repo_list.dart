import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/actions/actions.dart';
import 'package:async_redux_boilerplate/components/error_text.dart';
import 'package:async_redux_boilerplate/components/loading.dart';
import 'package:async_redux_boilerplate/components/repo_list_tile.dart';
import 'package:async_redux_boilerplate/models/github/repo.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';
import 'package:async_redux_boilerplate/models/states/repo_state.dart';
import 'package:flutter/material.dart';

class RepoList extends StatelessWidget {
  RepoList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      model: _ViewModel(),
      builder: (BuildContext context, _ViewModel vm) {
        if (vm.repoState.isLoading) {
          return Loading();
        }

        if (vm.repoState.error != null) {
          return ErrorText(error: vm.repoState.error);
        }

        if (vm.repoState.data.totalCount == 0) return Container();

        final List<Repo> repoItems = vm.repoState.data.items;

        return ListView.separated(
          itemCount: repoItems.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return RepoListTile(
              repo: repoItems[index],
              onTap: (String ownerName) {
                vm.onListTileTap(ownerName);
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                //   return OwnerDetailsScreen(ownerName: ownerName);
                // }));
                // viewModel.onListTileTap(ownerName);
              },
            );
          },
        );
      },
    );
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  Function(String) onListTileTap;
  RepoState repoState;

  _ViewModel.build({
    @required this.onListTileTap,
    @required this.repoState,
  }) : super(equals: [repoState]);

  @override
  _ViewModel fromStore() {
    return _ViewModel.build(
      onListTileTap: (ownerName) {
        dispatch(NavigateAction.pushNamed(
          "/ownerDetails",
          arguments: ownerName,
        ));
        dispatch(LoadOwnerDetailsAction(ownerName: ownerName));
      },
      repoState: store.state.repoState,
    );
  }
}
