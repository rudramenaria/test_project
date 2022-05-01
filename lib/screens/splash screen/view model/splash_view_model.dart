import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/common/widgets/navigation_widget.dart';
import 'package:test_project/screens/dashboard/view/dashboard_screen.dart';
import 'package:test_project/screens/login/view/login_screen.dart';

class SplashViewModel extends ChangeNotifier{
  bool? isLogin;
  bool loading = false;
  String? username;

  setLoading(bool val) {
    loading = val;
    notifyListeners();
  }

  checkLoginState(BuildContext context) async {
    //added this timer so you can see the splash screen, otherwise its so quick, you won't able to see the screen
    Timer(const Duration(seconds: 2),() async {
      if(await getIsLogin()) {
        if(await getUserData()) {
          navigate(context, const DashboardScreen());
        }
      } else {
        navigate(context, const LoginScreen()); 
      }
    });
  }

  Future<bool> setUserData(String username) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('username', username);
    this.username = username;
    return true;
  }

  Future<bool> getUserData() async {
    setLoading(true);
    SharedPreferences s = await SharedPreferences.getInstance();
    username = s.getString('username') ?? '';
    setLoading(false);
    return true;
  }

  Future<bool> setIsLogin(bool value) async {
    SharedPreferences p = await SharedPreferences.getInstance();
    p.setBool('isLogin', value);
    isLogin = value;
    notifyListeners();
    return true;
  }

  Future<bool> getIsLogin() async {
    setLoading(true);
    SharedPreferences p = await SharedPreferences.getInstance();
    isLogin = p.getBool('isLogin') ?? false;
    setLoading(false);
    return isLogin ?? false;
  }
}