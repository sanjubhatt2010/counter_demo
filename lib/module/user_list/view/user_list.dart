import 'package:counter_app/bloc/bloc_builder.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/helpers/app_route.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/module/user_list/bloc/logout_bloc.dart';
import 'package:counter_app/module/user_list/bloc/user_list_bloc.dart';
import 'package:counter_app/module/user_list/view/widget/user_list_tile.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserListScreen> {
  final LogoutBloc _logoutBloc = LogoutBloc();
  final UserListBloc _userListBloc = UserListBloc();

  @override
  void initState() {
    super.initState();
    _userListBloc.fetchUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.userList),
        actions: [
          BlocBuilder(
            bloc: _logoutBloc,
            builder: () {
              return TextButton(
                onPressed: () async {
                  await _logoutBloc.logout();
                  if (_logoutBloc.state.dataState == DataState.success) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.loginScreen, (route) => false);
                  }
                },
                child: _logoutBloc.state.dataState == DataState.loading
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        AppLocalization.logout,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: _userListBloc,
        builder: () {
          return _buildBodyState();
        },
      ),
    );
  }

  Widget _buildBodyState() {
    switch (_userListBloc.state.dataState) {
      case DataState.noData:
        return _buildNoDataState();
      case DataState.failed:
        return _buildFailedState();
      case DataState.noInternet:
        return _buildNoInternetState();
      case DataState.success:
        return _buildSuccessState();
      default:
        return _buildLoadingState();
    }
  }

  Widget _buildSuccessState() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemBuilder: (context, index) {
        return UserListTile(
          user: _userListBloc.state.userList[index],
          onTap:() =>  Navigator.of(context).pushNamed(AppRoutes.rewardScreen),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: _userListBloc.state.userList.length,
    );
  }

  Widget _buildFailedState() {
    return const Center(
      child: Text(
        AppLocalization.noInternet,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNoInternetState() {
    return const Center(
      child: Text(
        AppLocalization.noInternet,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNoDataState() {
    return const Center(
      child: Text(
        AppLocalization.noUserAvailable,
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: SizedBox(
        height: 45,
        width: 45,
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
