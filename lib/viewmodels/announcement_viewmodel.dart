import 'package:flutter/material.dart';
import 'package:griyaadmin/configs/shared_preferences.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class AnnouncementViewModel extends BaseViewModel {
  TextEditingController textTitle = TextEditingController();
  TextEditingController textDetail = TextEditingController();
  ResponseModel resultAnnouncement;
  final _apiService = APIService();

  Future<ResponseModel> post() async {
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data =
        await _apiService.postAnnouncement(textTitle.text, textDetail.text, id);
    resultAnnouncement = responseModelFromJson(data.body);
    setBusy(false);
    notifyListeners();
    return resultAnnouncement;
  }

  void resetText() {
    setBusy(true);
    textTitle.clear();
    textDetail.clear();
    setBusy(false);
    notifyListeners();
  }
}
