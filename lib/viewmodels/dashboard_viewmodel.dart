import 'package:griyaadmin/configs/shared_preferences.dart';
import 'package:griyaadmin/models/admin_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  AdminModel adminResult;
  final _apiService = APIService();
  String _name;
  String _position;

  String get name => _name;
  String get position => _position;

  Future initial() async {
    setBusy(true);
    getAdmin();
    setBusy(false);
    notifyListeners();
  }

  Future getAdmin() async {
    setBusyForObject(adminResult, true);
    setBusy(true);
    var id = await UserSharedPreference.getUser();
    final data = await _apiService.getAdmin(id);
    adminResult = adminModelFromJson(data.body);
    setBusyForObject(adminResult, false);
    _name = adminResult.body[0].fullname;
    _position = adminResult.body[0].position;
    setBusy(false);
    notifyListeners();
    return adminResult;
  }

  Future logOutUser() async {
    await UserSharedPreference.removeUser();
  }
}
