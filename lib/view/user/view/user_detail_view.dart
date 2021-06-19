import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_user_list/view/user/extensions/user_model_extension.dart';
import 'package:flutter_user_list/view/user/model/user_model.dart';
import 'package:flutter_user_list/view/user/viewmodel/user_detail_view_model.dart';

class UserDetailView extends StatefulWidget {
  final int? userId;

  const UserDetailView({Key? key, this.userId}) : super(key: key);

  @override
  _UserDetailViewState createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  final viewModel = UserDetailViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.setContext(context);
    viewModel.setUserId(widget.userId!);
    viewModel.getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              viewModel.getUserDetail();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (viewModel.userDetailState == UserDetailState.LOADING) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.userDetailState == UserDetailState.SUCCESS) {
            final data = viewModel.userDetailModel!.data;
            return buildUserDetail(size, data!, theme);
          }
          return Container();
        },
      ),
    );
  }

  Container buildUserDetail(Size size, UserModel data, ThemeData theme) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: data.avatarTag,
            child: Image.network(
              '${data.avatar}',
            ),
          ),
          SizedBox(height: 20),
          Text(
            '${data.firstName} ${data.lastName}',
            style: theme.textTheme.headline4,
          ),
          SizedBox(height: 5),
          Text(
            '${data.email}',
            style: theme.textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
