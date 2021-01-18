import 'package:griyaadmin/configs/shared_preferences.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/models/topup_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class TopupViewModel extends BaseViewModel {
  final _apiService = APIService();
  TopupModel topupResult;
  ResponseModel responseResult;

  Future initial() async {
    setBusy(true);
    getUnconfirm();
    setBusy(false);
  }

  Future<TopupModel> getUnconfirm() async {
    setBusy(true);
    setBusyForObject(topupResult, true);
    final data = await _apiService.getUnconfirmTopup();
    topupResult = topupModelFromJson(data.body);
    setBusyForObject(topupResult, false);
    setBusy(false);
    notifyListeners();
    return topupResult;
  }

  Future<ResponseModel> acceptTopUp(
      String topupid, String userid, String nominal) async {
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.acceptTopup(id, topupid, userid, nominal);
    responseResult = responseModelFromJson(data.body);
    getUnconfirm();
    setBusy(false);
    notifyListeners();
    return responseResult;
  }

  Future<ResponseModel> cancelTopup(String topupid) async {
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.cancelTopup(id, topupid);
    responseResult = responseModelFromJson(data.body);
    getUnconfirm();
    setBusy(false);
    notifyListeners();
    return responseResult;
  }
}
