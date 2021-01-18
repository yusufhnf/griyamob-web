import 'dart:async';

import 'package:flutter/material.dart';
import 'package:griyaadmin/configs/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel({this.context});
  BuildContext context;
  Future initial() async {
    startLaunch();
    notifyListeners();
  }

  startLaunch() async {
    notifyListeners();
    var getID = await UserSharedPreference.getUser();
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushNamedAndRemoveUntil(
          context, getID == null ? '/login' : '/dashboard', (route) => false);
    });
  }
}
