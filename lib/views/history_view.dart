import 'package:flutter/material.dart';
import 'package:griyaadmin/configs/string_format.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:griyaadmin/viewmodels/history_viewmodel.dart';
import 'package:griyaadmin/widgets/screen_message.dart';
import 'package:stacked/stacked.dart';

class HistoryView extends StatelessWidget {
  final StringFormat _format = StringFormat();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistoryViewModel>.reactive(
      viewModelBuilder: () => HistoryViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.busy(model.historyResult)
          ? CircularProgressIndicator()
          : Expanded(
              child: model.historyResult.body.isEmpty
                  ? ScreenMessage(
                      image: Icon(
                        Icons.not_interested_outlined,
                        color: Colors.red,
                        size: 130.0,
                      ),
                      label: "Tidak ada data",
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.white,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: model.historyResult.body.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListTile(
                            leading: Text(_format.convertTimeStamp(model
                                .historyResult.body[index].datetime
                                .toString())),
                            title: Text(
                              _format.getRupiahCurrency(
                                  model.historyResult.body[index].jumlah),
                              style: AppStyle.getStatusAction(
                                  model.historyResult.body[index].action),
                            ),
                            subtitle:
                                Text(model.historyResult.body[index].detail),
                            trailing: Text(
                                model.historyResult.body[index].sumbertarget),
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}
