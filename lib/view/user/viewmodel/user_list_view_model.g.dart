// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserListViewModel on _UserListViewModelBase, Store {
  final _$userListStateAtom =
      Atom(name: '_UserListViewModelBase.userListState');

  @override
  UserListState get userListState {
    _$userListStateAtom.reportRead();
    return super.userListState;
  }

  @override
  set userListState(UserListState value) {
    _$userListStateAtom.reportWrite(value, super.userListState, () {
      super.userListState = value;
    });
  }

  @override
  String toString() {
    return '''
userListState: ${userListState}
    ''';
  }
}
