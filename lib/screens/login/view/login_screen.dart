import 'package:flutter/material.dart';
import 'package:test_project/common/app_colors.dart';
import 'package:test_project/common/assets.dart';
import 'package:test_project/common/theme.dart';
import 'package:test_project/common/widgets/app_button.dart';
import 'package:test_project/common/widgets/app_text.dart';
import 'package:test_project/common/widgets/navigation_widget.dart';
import 'package:test_project/common/widgets/text_form_field.dart';
import 'package:test_project/screens/dashboard/view/dashboard_screen.dart';
import 'package:test_project/screens/splash%20screen/view%20model/splash_view_model.dart';
import 'package:provider/provider.dart';

class EmailFieldValidator {
  static String? validate(String? value) {
    return value!.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(String? value) {
    return value!.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _fKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SplashViewModel svm = context.watch<SplashViewModel>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _fKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.logo,height: 200,width: double.infinity,),
                _loginTextWidget(),
                _descriptionTextWidget(),
                _emailTextField(),
                _passwordTextField(),
                _loginButton(svm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loginButton(SplashViewModel svm) => Padding(
    padding: const EdgeInsets.fromLTRB(37.9,40,41.1,23),
    child: AppButton(
      onPressed: () async {
        if(!(_fKey.currentState!.validate())) {
          return;
        }
        if(await svm.setIsLogin(true)) {
          if(await svm.setUserData(_userNameController.text)) {
            navigate(context, const DashboardScreen());
          }
        }
      },
      color: AppColor.black,
      child:  AppText(text: 'LOGIN',style: AppTheme.regularTextTheme().copyWith(color: AppColor.white,fontSize: 19,fontWeight: FontWeight.w500),),
    ),
  );

  _emailTextField() {
    return Padding(
              padding: const EdgeInsets.fromLTRB(36,12.7,43,0),
              child: AppTextFormField(
                validator: (value) => EmailFieldValidator.validate(value),
                obscure: false,
                controller: _userNameController,
                decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.all(0),
                  prefixIcon: Image.asset(Assets.personIcon,height: 16,width: 16,),
                  filled: true,
                  fillColor: AppColor.textFieldGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColor.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColor.white)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColor.white)
                  )),),
            );
  }
  
  _passwordTextField() {
    return Padding(
              padding: const EdgeInsets.fromLTRB(36,13,43,0),
              child: AppTextFormField(
                validator: (value) => PasswordFieldValidator.validate(value),
                obscure: true,
                decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.all(0),
                  prefixIcon: Image.asset(Assets.eyeIcon,height: 16,width: 16,),
                  filled: true,
                  fillColor: AppColor.textFieldGrey,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColor.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColor.white)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppColor.white)
                  )),),
            );
  }

  _loginTextWidget() => Padding(
    padding: const EdgeInsets.fromLTRB(37,15,0,5),
    child: AppText(text: 'LOGIN NOW',style: AppTheme.titleTextTheme().copyWith(color: AppColor.blue),),
  );

  _descriptionTextWidget() => Padding(
    padding: const EdgeInsets.fromLTRB(38,0,0,0),
    child: AppText(text: 'Please enter your credentials below',style: AppTheme.regularTextTheme().copyWith(color: AppColor.black),),
  );

}