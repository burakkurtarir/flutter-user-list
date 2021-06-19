import 'dart:convert';

import 'package:flutter_user_list/view/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list_model.g.dart';

UserListModel userListModelFromJson(String str) =>
    UserListModel.fromJson(jsonDecode(str));

@JsonSerializable()
class UserListModel {
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? total;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<UserModel>? data;

  UserListModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) =>
      _$UserListModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserListModelToJson(this);
}
