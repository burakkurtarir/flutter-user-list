import 'dart:convert';

import 'package:flutter_user_list/view/user/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_user_model.g.dart';

SingleUserModel singleUserModelFromJson(String str) =>
    SingleUserModel.fromJson(jsonDecode(str));

@JsonSerializable()
class SingleUserModel {
  final UserModel? data;

  SingleUserModel({this.data});

  factory SingleUserModel.fromJson(Map<String, dynamic> json) =>
      _$SingleUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserModelToJson(this);
}
