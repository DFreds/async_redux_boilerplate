import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/components/error_text.dart';
import 'package:async_redux_boilerplate/components/loading.dart';
import 'package:async_redux_boilerplate/components/partial_bold_text.dart';
import 'package:async_redux_boilerplate/models/github/owner_details_result.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';
import 'package:async_redux_boilerplate/models/states/owner_details_state.dart';
import 'package:flutter/material.dart';

class OwnerDetails extends StatelessWidget {
  OwnerDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      model: _ViewModel(),
      builder: (BuildContext context, _ViewModel vm) {
        if (vm.ownerDetailsState.isLoading) {
          return Loading();
        }

        if (vm.ownerDetailsState.error != null) {
          return ErrorText(error: vm.ownerDetailsState.error);
        }

        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: _createColumn(context, vm),
          ),
        );
      },
    );
  }

  Column _createColumn(BuildContext context, _ViewModel vm) {
    OwnerDetailsResult data = vm.ownerDetailsState.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PartialBoldText(
          boldText: 'Login: ',
          normalText: data.login,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Name: ',
          normalText: data.name,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Location: ',
          normalText: data.location,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Public Repos: ',
          normalText: data.publicRepos.toString(),
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Followers: ',
          normalText: data.followers.toString(),
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Following: ',
          normalText: data.following.toString(),
          defaultText: 'Not set',
        ),
      ],
    );
  }
}

class _ViewModel extends BaseModel<AppState> {
  _ViewModel();

  OwnerDetailsState ownerDetailsState;

  _ViewModel.build({
    @required this.ownerDetailsState,
  }) : super(equals: [ownerDetailsState]);

  @override
  _ViewModel fromStore() {
    return _ViewModel.build(
      ownerDetailsState: state.ownerDetailsState,
    );
  }
}
