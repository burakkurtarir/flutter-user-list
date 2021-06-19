import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  BuildContext? context;
  Dio? dio;

  void setContext(BuildContext context);
  void init();
}
