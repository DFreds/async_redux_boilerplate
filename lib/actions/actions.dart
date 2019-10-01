import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:async_redux_boilerplate/models/github/github_repo_result.dart';
import 'package:async_redux_boilerplate/models/github/owner_details_result.dart';
import 'package:async_redux_boilerplate/models/states/app_state.dart';
import 'package:async_redux_boilerplate/services/github_repository.dart';
import 'package:flutter/material.dart';

class LoadOwnerDetailsAction extends ReduxAction<AppState> {
  LoadOwnerDetailsAction({
    this.ownerName,
  });

  final String ownerName;

  @override
  void before() {
    dispatch(SetOwnerDetailsLoadingAction(isLoading: true));
  }

  @override
  Future<AppState> reduce() async {
    try {
      final OwnerDetailsResult ownerDetails = await repository.loadOwnerDetails(ownerName);
      return state.copyWith(
        ownerDetailsState: state.ownerDetailsState.copyWith(
          data: ownerDetails,
          error: null,
        ),
      );
    } catch (e) {
      return state.copyWith(
        ownerDetailsState: state.ownerDetailsState.copyWith(
          data: OwnerDetailsResult(),
          error: e.toString(),
        ),
      );
    }
  }

  @override
  void after() {
    dispatch(SetOwnerDetailsLoadingAction(isLoading: false));
  }
}

class QueryChangedAction extends ReduxAction<AppState> {
  QueryChangedAction({
    @required this.query,
  });

  final String query;

  @override
  void before() {
    dispatch(SetQueryAction(query: query));

    if (query.length < 3) {
      dispatch(SetRepoLoadingAction(isLoading: false));
    } else {
      dispatch(SetRepoLoadingAction(isLoading: true));
    }
  }

  @override
  Future<AppState> reduce() async {
    if (query.length < 3) return null;

    try {
      final GithubRepoResult repoResult = await repository.loadRepoResult(query);

      return state.copyWith(
        repoState: state.repoState.copyWith(
          data: repoResult,
          error: null,
        ),
      );
    } catch (e) {
      return state.copyWith(
        repoState: state.repoState.copyWith(
          data: GithubRepoResult.initial(),
          error: e.toString(),
        ),
      );
    }
  }

  @override
  void after() {
    dispatch(SetRepoLoadingAction(isLoading: false));
  }
}

class SetOwnerDetailsLoadingAction extends ReduxAction<AppState> {
  SetOwnerDetailsLoadingAction({
    @required this.isLoading,
  });

  final bool isLoading;

  @override
  AppState reduce() {
    return state.copyWith(
      ownerDetailsState: state.ownerDetailsState.copyWith(
        isLoading: isLoading,
      ),
    );
  }
}

class SetRepoLoadingAction extends ReduxAction<AppState> {
  SetRepoLoadingAction({
    @required this.isLoading,
  });

  final bool isLoading;

  @override
  AppState reduce() {
    return state.copyWith(
      repoState: state.repoState.copyWith(
        isLoading: isLoading,
      ),
    );
  }
}

class SetQueryAction extends ReduxAction<AppState> {
  SetQueryAction({
    this.query,
  });

  final String query;

  @override
  AppState reduce() {
    return state.copyWith(
      repoState: state.repoState.copyWith(
        query: query,
      ),
    );
  }
}
