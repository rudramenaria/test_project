import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/screens/login/view%20model/login_view_model.dart';
import 'package:test_project/screens/splash%20screen/view%20model/splash_view_model.dart';
import 'package:test_project/screens/splash%20screen/view/splash_screen.dart';

import 'screens/dashboard/view model/dashboard_view_model.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        ChangeNotifierProvider<SplashViewModel>(create: (_) => SplashViewModel()),
        ChangeNotifierProvider<DashboardViewModel>(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        navigatorKey: navKey,
        title: 'Test Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}