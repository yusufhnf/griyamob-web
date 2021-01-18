import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final _apiService = APIService();

  TextEditingController emailUser = TextEditingController();
  TextEditingController passUser = TextEditingController();
  TextEditingController positionUser = TextEditingController();
  TextEditingController fullnameUser = TextEditingController();

  Future initial() async {
    setBusy(true);
    //Insert Here
    setBusy(false);
  }

  Future<ResponseModel> register() async {
    notifyListeners();
    setBusy(true);
    final data = await _apiService.createUser(
        emailUser.text, positionUser.text, fullnameUser.text, passUser.text);
    setBusy(false);
    return ResponseModel.fromJson(json.decode(data.body));
  }
}
