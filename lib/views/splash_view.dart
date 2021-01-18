import 'package:flutter/material.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:griyaadmin/viewmodels/splash_viewmodel.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(context: context),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: LoadingBouncingLine.circle(
            backgroundColor: AppStyle.primaryColor,
          ),
        ),
      ),
    );
  }
}
