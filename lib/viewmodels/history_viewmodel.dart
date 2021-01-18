import 'package:griyaadmin/models/history_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class HistoryViewModel extends BaseViewModel {
  final _apiService = APIService();
  HistoryModel historyResult;
  int _sumPemasukan;
  int _sumPengeluaran;

  int get sumPemasukan => _sumPemasukan;
  int get sumPengeluaran => _sumPengeluaran;

  Future initial() async {
    setBusy(true);
    _sumPemasukan = 0;
    _sumPengeluaran = 0;
    getAllHistory();
    setBusy(false);
  }

  Future<HistoryModel> getAllHistory() async {
    setBusy(true);
    setBusyForObject(historyResult, true);
    final data = await _apiService.getAllHistory();
    historyResult = historyModelFromJson(data.body);
    setBusy(false);
    setBusyForObject(historyResult, false);
    notifyListeners();
    return historyResult;
  }

  Future getTotal(HistoryModel model) async {
    for (var i = 0; i < model.body.length; i++) {
      if (model.body[i].action == "D") {
        _sumPemasukan += model.body[i].jumlah;
      } else {
        _sumPengeluaran += model.body[i].jumlah;
      }
    }
  }
}
