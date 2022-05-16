import 'package:counter_app/bloc/bloc_builder.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/helpers/app_route.dart';
import 'package:counter_app/models/state_model.dart';
import 'package:counter_app/module/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginBloc _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.login),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              AppLocalization.chooseLoginMethod,
            ),
            const SizedBox(height: 50),
            BlocBuilder(
              bloc: _loginBloc,
              builder: () {
                return SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                    ),
                    onPressed: () async {
                      await _loginBloc.login(LoginType.google);
                      if (_loginBloc.state.dataState == DataState.success) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.userListScreen, (route) => false);
                      }
                    },
                    child: _loginBloc.state.dataState == DataState.loading
                        ? const SizedBox(
                            height: 35,
                            width: 35,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            AppLocalization.google,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
