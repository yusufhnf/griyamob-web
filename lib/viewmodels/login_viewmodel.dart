import 'package:flutter/material.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final _apiService = APIService();
  ResponseModel resultLogin;

  TextEditingController emailUser = TextEditingController();
  TextEditingController passUser = TextEditingController();

  Future<ResponseModel> login() async {
    setBusy(true);
    final data = await _apiService.loginUser(emailUser.text, passUser.text);
    resultLogin = responseModelFromJson(data.body);
    setBusy(false);
    notifyListeners();
    return resultLogin;
  }
}
