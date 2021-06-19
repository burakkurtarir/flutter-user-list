// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleUserModel _$SingleUserModelFromJson(Map<String, dynamic> json) {
  return SingleUserModel(
    data: json['data'] == null
        ? null
        : UserModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SingleUserModelToJson(SingleUserModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
