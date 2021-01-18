import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';
import 'package:griyaadmin/viewmodels/summary_viewmodel.dart';
import 'package:griyaadmin/widgets/loading_progress.dart';
import 'package:stacked/stacked.dart';

class SummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: ViewModelBuilder<SummaryViewModel>.reactive(
          viewModelBuilder: () => SummaryViewModel(),
          onModelReady: (model) => model.initial(),
          builder: (context, model, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tranksaksi Harian",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: model.busy(model.resultStatistik)
                    ? Center(
                        child: LoadingProgress(),
                      )
                    : Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue[900]),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        child: BezierChart(
                          bezierChartScale: BezierChartScale.WEEKLY,
                          fromDate: model.fromDate,
                          toDate: model.toDate,
                          selectedDate: model.toDate,
                          series: [
                            BezierLine(
                              label: "Debet",
                              lineColor: Colors.green,
                              onMissingValue: (dateTime) {
                                return 0.0;
                              },
                              data: model.resultDataPointDebet,
                            ),
                            BezierLine(
                              label: "Kredit",
                              lineColor: Colors.red,
                              onMissingValue: (dateTime) {
                                return 0.0;
                              },
                              data: model.resultDataPointKredit,
                            ),
                          ],
                          config: BezierChartConfig(
                            verticalIndicatorStrokeWidth: 3.0,
                            verticalIndicatorColor: Colors.black26,
                            showVerticalIndicator: true,
                            verticalIndicatorFixedPosition: false,
                            backgroundColor: Colors.blue[900],
                            footerHeight: 30.0,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
