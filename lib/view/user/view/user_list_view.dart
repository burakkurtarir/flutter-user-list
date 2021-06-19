import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../extensions/user_model_extension.dart';
import '../viewmodel/user_list_view_model.dart';

class UserListView extends StatefulWidget {
  UserListView({Key? key}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final viewModel = UserListViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.setContext(context);
    viewModel.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List View'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              viewModel.getUserList();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (viewModel.userListState == UserListState.LOADING) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.userListState == UserListState.SUCCESS) {
            return buildUserList();
          }
          return Container();
        },
      ),
    );
  }

  ListView buildUserList() {
    return ListView.builder(
      itemCount: viewModel.userListModel!.data!.length,
      itemBuilder: (context, index) {
        final data = viewModel.userListModel!.data![index];

        return ListTile(
          onTap: () {
            viewModel.navigateToUserDetail(data.id!);
          },
          leading: Hero(
            tag: data.avatarTag,
            child: Image.network('${data.avatar}'),
          ),
          title: Text('${data.firstName} ${data.firstName}'),
          subtitle: Text('${data.email}'),
        );
      },
    );
  }
}
