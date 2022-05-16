import 'package:counter_app/firebase/firebase_authentication.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:counter_app/helpers/app_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  _naviagteToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (FirebaseAuthentication.authInstance.currentUser == null) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRoutes.userListScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _naviagteToNextScreen(context);
    return const Scaffold(
      body: Center(
        child: Text(
          AppLocalization.splashTitle,
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
