import 'package:dio/dio.dart';
import 'package:flutter_user_list/view/user/model/single_user_model.dart';
import 'package:flutter_user_list/view/user/model/user_list_model.dart';
import 'package:flutter_user_list/view/user/service/IUserService.dart';

class UserService implements IUserService {
  final Dio dio;

  UserService(this.dio);

  @override
  Future<Response<UserListModel>?> getUserList() async {
    (dio.transformer as DefaultTransformer).jsonDecodeCallback =
        userListModelFromJson;
    final response = await dio.get<UserListModel>('users');
    return response;
  }

  @override
  Future<Response<SingleUserModel?>> getSingleUser(int id) async {
    (dio.transformer as DefaultTransformer).jsonDecodeCallback =
        singleUserModelFromJson;
    final response = await dio.get<SingleUserModel>('users/$id');
    return response;
  }
}
