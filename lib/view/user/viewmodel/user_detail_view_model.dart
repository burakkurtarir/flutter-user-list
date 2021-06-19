import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_user_list/view/user/model/single_user_model.dart';
import 'package:flutter_user_list/view/user/service/IUserService.dart';
import 'package:flutter_user_list/view/user/service/user_service.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/base_view_model.dart';

part 'user_detail_view_model.g.dart';

class UserDetailViewModel = _UserDetailViewModelBase with _$UserDetailViewModel;

abstract class _UserDetailViewModelBase with Store, BaseViewModel {
  late final IUserService userService;

  _UserDetailViewModelBase() {
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

  SingleUserModel? userDetailModel;
  @observable
  UserDetailState userDetailState = UserDetailState.INITIAL;

  int? userId;
  void setUserId(int id) {
    userId = id;
  }

  Future<void> getUserDetail() async {
    try {
      userDetailState = UserDetailState.LOADING;
      final response = await userService.getSingleUser(userId!);
      if (response.data is SingleUserModel) {
        userDetailModel = response.data;
        userDetailState = UserDetailState.SUCCESS;
      } else {
        userDetailState = UserDetailState.ERROR;
      }
    } catch (e) {
      userDetailState = UserDetailState.ERROR;
    }
  }
}

enum UserDetailState {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
}
