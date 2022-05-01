import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/common/assets.dart';
import 'package:test_project/screens/login/view/login_screen.dart';
import 'package:test_project/screens/splash%20screen/view%20model/splash_view_model.dart';

import '../../../common/app_colors.dart';
import '../../../common/widgets/navigation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<SplashViewModel>(context,listen: false).checkLoginState(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(Assets.logo,height: 150,width: 150,),
      ),
    );
  }
}