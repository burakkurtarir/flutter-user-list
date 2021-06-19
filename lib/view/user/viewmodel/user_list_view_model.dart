import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_list/core/base/base_view_model.dart';
import 'package:flutter_user_list/view/user/model/user_list_model.dart';
import 'package:flutter_user_list/view/user/service/IUserService.dart';
import 'package:flutter_user_list/view/user/service/user_service.dart';
import 'package:flutter_user_list/view/user/view/user_detail_view.dart';
import 'package:mobx/mobx.dart';

part 'user_list_view_model.g.dart';

class UserListViewModel = _UserListViewModelBase with _$UserListViewModel;

abstract class _UserListViewModelBase with Store, BaseViewModel {
  late final IUserService userService;
  _UserListViewModelBase() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://reqres.in/api/',
      ),
    );
    userService = UserService(dio!);
  }

  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  UserListModel? userListModel;
  @observable
  UserListState userListState = UserListState.INITIAL;

  Future<void> getUserList() async {
    try {
      userListState = UserListState.LOADING;
      final response = await userService.getUserList();
      if (response!.data is UserListModel) {
        userListModel = response.data;
        userListState = UserListState.SUCCESS;
      } else {
        userListState = UserListState.ERROR;
      }
    } catch (e) {
      print(e);
      userListState = UserListState.ERROR;
    }
  }

  void navigateToUserDetail(int userId) {
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (BuildContext context) => UserDetailView(
          userId: userId,
        ),
      ),
    );
  }
}

enum UserListState {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
}
