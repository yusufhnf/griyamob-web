import 'package:bezier_chart/bezier_chart.dart';
import 'package:griyaadmin/models/history_model.dart';
import 'package:griyaadmin/models/statistik_model.dart';
import 'package:griyaadmin/services/api_service.dart';
import 'package:stacked/stacked.dart';

class SummaryViewModel extends BaseViewModel {
  final _apiService = APIService();
  HistoryModel historyResult;
  StatistikModel resultStatistik;
  List<DataPoint<DateTime>> resultDataPointDebet = [];
  List<DataPoint<DateTime>> resultDataPointKredit = [];
  int _pemasukan = 0;
  int _pengeluaran = 0;
  int _countTransaksi = 0;

  DateTime fromDate = DateTime(2020, 11, 30);
  DateTime toDate = DateTime.now();

  Future initial() async {
    setBusy(true);
    getStatistik();
    setBusy(false);
  }

  Future<HistoryModel> getAllSummaryHistory() async {
    setBusy(true);
    setBusyForObject(historyResult, true);
    final data = await _apiService.getAllSummaryHistory();
    historyResult = historyModelFromJson(data.body);
    setBusy(false);
    setBusyForObject(historyResult, false);
    notifyListeners();
    return historyResult;
  }

  Future getStatistik() async {
    setBusy(true);
    setBusyForObject(resultStatistik, true);
    final data = await _apiService.statistik();
    resultStatistik = statistikModelFromJson(data.body);
    for (var i = 0; i < resultStatistik.body.length; i++) {
      if (resultStatistik.body[i].action == "D") {
        resultDataPointDebet.add(DataPoint(
            value: resultStatistik.body[i].totalaksi.toDouble(),
            xAxis: resultStatistik.body[i].datetime));
      } else {
        resultDataPointKredit.add(DataPoint(
            value: resultStatistik.body[i].totalaksi.toDouble(),
            xAxis: resultStatistik.body[i].datetime));
      }
    }
    if (resultStatistik.body[0].datetime.month == DateTime.now().month) {
      if (resultStatistik.body[0].action == "K") {
        _pemasukan = resultStatistik.body[0].totalnominal;
      }
      if (resultStatistik.body[1].action == "D") {
        _pengeluaran = resultStatistik.body[1].totalnominal;
      }
      _countTransaksi =
          resultStatistik.body[0].totalaksi + resultStatistik.body[1].totalaksi;
    }
    setBusyForObject(resultStatistik, false);
    setBusy(false);
    notifyListeners();
  }
}
