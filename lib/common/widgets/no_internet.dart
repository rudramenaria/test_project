import 'package:flutter/material.dart';
import 'package:test_project/common/app_colors.dart';
import 'package:test_project/common/theme.dart';
import 'package:test_project/common/widgets/app_text.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AppText(text: 'No Internet\nTurn on mobile data or use Wi-Fi to acess this app',textAlign: TextAlign.center,style: AppTheme.titleTextTheme().copyWith(color: AppColor.blue),),
        ),
      ),
    );
  }
}