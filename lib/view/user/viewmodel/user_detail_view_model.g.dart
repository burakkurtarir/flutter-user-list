// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserDetailViewModel on _UserDetailViewModelBase, Store {
  final _$userDetailStateAtom =
      Atom(name: '_UserDetailViewModelBase.userDetailState');

  @override
  UserDetailState get userDetailState {
    _$userDetailStateAtom.reportRead();
    return super.userDetailState;
  }

  @override
  set userDetailState(UserDetailState value) {
    _$userDetailStateAtom.reportWrite(value, super.userDetailState, () {
      super.userDetailState = value;
    });
  }

  @override
  String toString() {
    return '''
userDetailState: ${userDetailState}
    ''';
  }
}
