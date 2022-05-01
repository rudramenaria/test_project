import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/common/widgets/no_internet.dart';
import 'package:test_project/main.dart';
import 'package:test_project/screens/dashboard/models/problem_medication.model.dart';

class DashboardViewModel extends ChangeNotifier {
  bool loading = false;
  String timeOfDay = '';
  String image = '';
  ProblemMedicationModel? problemMedicationModel;

  setLoading(bool val) {
    loading = val;
    notifyListeners();
  }
  
  checkTimeOfDay() {
    setLoading(true);
    int _currHour = DateTime.now().hour;
    if(_currHour >= 1 && _currHour <=12) {
      timeOfDay = 'Good Morning';
      image = 'https://img.icons8.com/external-flaticons-lineal-color-flat-icons/2x/external-morning-lifestyles-flaticons-lineal-color-flat-icons-2.png';
    } else if(_currHour >= 13 && _currHour <=18) {
      timeOfDay = 'Good Afternoon';
      image = 'https://img.icons8.com/external-flaticons-flat-flat-icons/2x/external-noon-morning-flaticons-flat-flat-icons-2.png';
    } else if(_currHour >= 19 && _currHour <=24) {
      timeOfDay = 'Good Evening';
      image = 'https://img.icons8.com/external-flaticons-flat-flat-icons/2x/external-evening-morning-flaticons-flat-flat-icons-2.png';
    }
    setLoading(false);
  }

  Future<bool> getMediationData() async {
    setLoading(true);
    try {
      Response _res = await Dio().get('https://run.mocky.io/v3/ff86428d-d4e7-4168-8f09-5be57a34f8cf',);
      if(_res.statusCode == 200) {
        setLoading(false);
        problemMedicationModel = ProblemMedicationModel.fromJson(_res.data);
        return true;
      } else {
        setLoading(false);
        return false;
      }
    } on DioError catch (e) {
      setLoading(false);
      if(e.type == DioErrorType.other) {
        //no internet
        navKey.currentState?.push(CupertinoPageRoute(builder: (context) => const NoInternetScreen()));
      }
      return false;
    }
  }
}