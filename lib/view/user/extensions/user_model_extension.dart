import 'package:flutter_user_list/view/user/model/user_model.dart';

extension UserModelExtension on UserModel {
  String get avatarTag => 'user_avatar_${this.id}';
}
