import 'package:counter_app/helpers/app_color.dart';
import 'package:counter_app/helpers/app_localization.dart';
import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppLocalization.underDevelopment),
      ),
      body: const Center(
        child: Text(
          AppLocalization.underDevelopment,
          style: TextStyle(
            color: AppColor.black,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
