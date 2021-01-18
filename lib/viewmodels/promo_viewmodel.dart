import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:griyaadmin/configs/shared_preferences.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class PromoViewModel extends BaseViewModel {
  TextEditingController textTitle = TextEditingController();
  TextEditingController textDetail = TextEditingController();
  bool isAnnouncement = true;
  ResponseModel resultPromo;
  final _apiService = APIService();

  Future initial() async {
    setBusy(true);
    setBusy(false);
  }

  void changeStatus(bool value) {
    isAnnouncement = value;
    notifyListeners();
  }

  Future<ResponseModel> post() async {
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.postPromo(textTitle.text, textDetail.text);
    if (isAnnouncement == true) {
      final dataAnnouncement = await _apiService.postAnnouncement(
          textTitle.text, textDetail.text, id);
      resultPromo = responseModelFromJson(dataAnnouncement.body);
      if (resultPromo.status != 0) {
        setBusy(false);
        notifyListeners();
        return resultPromo;
      }
    }
    resultPromo = responseModelFromJson(data.body);
    setBusy(false);
    notifyListeners();
    return resultPromo;
  }

  void resetText() {
    setBusy(true);
    textTitle.clear();
    textDetail.clear();
    setBusy(false);
    notifyListeners();
  }
}
