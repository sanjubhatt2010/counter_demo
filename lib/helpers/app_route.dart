import 'package:counter_app/module/counter/view/counter_screen.dart';
import 'package:counter_app/module/login/view/login_screen.dart';
import 'package:counter_app/module/referral/referral.dart';
import 'package:counter_app/module/reward/view/reward.dart';
import 'package:counter_app/module/splash/splash_screen.dart';
import 'package:counter_app/module/under_dev/under_development.dart';
import 'package:counter_app/module/user_list/view/user_list.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Route name constants
  static const String splashScreen = '/splashScreen';
  static const String loginScreen = '/loginScreen';
  static const String counterScreen = '/counterPage';
  static const String userListScreen = '/userListScreen';
  static const String rewardScreen = '/rewardScreen';
  static const String referralScreen = '/referralScreen';
  static const String underDevelopment = '/underDevelopment';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: (context) => const SplashScreen(),
      loginScreen: (context) => const LoginScreen(),
      counterScreen: (context) => const CounterScreen(),
      userListScreen: (context) => const UserListScreen(),
      rewardScreen: (context) => const RewardScreen(),
      referralScreen: (context) => const ReferralScreen(),
      underDevelopment: (context) => const UnderDevelopmentScreen(),
    };
  }
}
