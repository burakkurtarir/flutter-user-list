import 'package:dio/dio.dart';
import 'package:flutter_user_list/view/user/model/single_user_model.dart';
import 'package:flutter_user_list/view/user/model/user_list_model.dart';

abstract class IUserService {
  Future<Response<UserListModel>?> getUserList();
  Future<Response<SingleUserModel?>> getSingleUser(int id);
}
