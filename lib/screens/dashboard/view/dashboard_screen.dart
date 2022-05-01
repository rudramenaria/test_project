import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/common/app_colors.dart';
import 'package:test_project/common/assets.dart';
import 'package:test_project/common/theme.dart';
import 'package:test_project/common/widgets/app_button.dart';
import 'package:test_project/common/widgets/app_text.dart';
import 'package:test_project/common/widgets/text_form_field.dart';
import 'package:test_project/screens/dashboard/models/problem_medication.model.dart';
import 'package:test_project/screens/dashboard/view%20model/dashboard_view_model.dart';
import 'package:test_project/screens/splash%20screen/view%20model/splash_view_model.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<DashboardViewModel>(context,listen: false).checkTimeOfDay();
      Provider.of<DashboardViewModel>(context,listen: false).getMediationData();
    });
  }
  @override
  Widget build(BuildContext context) {
    SplashViewModel svm = context.read<SplashViewModel>();
    DashboardViewModel dvm = context.watch<DashboardViewModel>();
    return Scaffold(
      body: SafeArea(
        child: dvm.loading? const Center(child: CupertinoActivityIndicator(),) : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dvm.image.isEmpty? const SizedBox.shrink() : Center(child: Image.network(dvm.image,height: 100,width: 100,)),
              _greetTextWidget(dvm,svm),
              _medicationListViewWidget(dvm),
            ],
          ),
        ),
      ),
    );
  }

  _greetTextWidget(DashboardViewModel dvm, SplashViewModel svm) => Padding(
    padding: const EdgeInsets.fromLTRB(37,10,0,5),
    child: AppText(text: (dvm.timeOfDay) +',\n'+ (svm.username?? ''),style: AppTheme.titleTextTheme().copyWith(color: AppColor.blue),),
  );

  _medicationListViewWidget(DashboardViewModel dvm) => Padding(
    padding: const EdgeInsets.fromLTRB(38,0,0,0),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: (dvm.problemMedicationModel?.problems ?? []).length,
      itemBuilder: (ctx,i) {
        MedicationsClass? dia;
        if(dvm.problemMedicationModel?.problems![i].diabetes!=null) {
          if(dvm.problemMedicationModel?.problems![i].diabetes!.first.medications!=null) {
            if(dvm.problemMedicationModel?.problems![i].diabetes!.first.medications!.first.medicationsClasses!=null) {
              dia = dvm.problemMedicationModel?.problems![i].diabetes!.first.medications!.first.medicationsClasses!.first;
            }
          }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            AppText(text: 'Diabetes',style: AppTheme.titleTextTheme().copyWith(color: AppColor.black),),
            _classNameWidget(dia?.className),
            _classNameWidget(dia?.className2),
          ],
        );
      }
    )
  );

  ListView _classNameWidget(List<ClassName>? className) {
    return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: (className ?? []).length,
            itemBuilder: (ctx,j) {
              return Column(
                children: [
                  className![j].associatedDrug == null ? const SizedBox() : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        title: AppText(text: (className[j].associatedDrug!.first.name ?? '') +' ('+ (className[j].associatedDrug!.first.strength ?? '') + ')' ,style: AppTheme.regularTextTheme().copyWith(color: AppColor.black,fontWeight: FontWeight.bold),),
                        subtitle: AppText(text: className[j].associatedDrug!.first.dose ,style: AppTheme.regularTextTheme().copyWith(color: AppColor.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  className[j].associatedDrug2 ==null ? const SizedBox.shrink() : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      child: ListTile(
                        title: AppText(text: (className[j].associatedDrug2!.first.name ?? '') +' ('+ (className[j].associatedDrug2!.first.strength ?? '') + ')' ,style: AppTheme.regularTextTheme().copyWith(color: AppColor.black,fontWeight: FontWeight.bold),),
                        subtitle: AppText(text: className[j].associatedDrug2!.first.dose ,style: AppTheme.regularTextTheme().copyWith(color: AppColor.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
                ],
              );
            }
          );
  }
}