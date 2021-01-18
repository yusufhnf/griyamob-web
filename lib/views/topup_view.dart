import 'package:flutter/material.dart';
import 'package:griyaadmin/configs/string_format.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:griyaadmin/viewmodels/topup_viewmodel.dart';
import 'package:griyaadmin/widgets/screen_message.dart';
import 'package:stacked/stacked.dart';

class TopupView extends StatelessWidget {
  final StringFormat _format = StringFormat();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TopupViewModel>.reactive(
      viewModelBuilder: () => TopupViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => model.busy(model.topupResult)
          ? CircularProgressIndicator()
          : Expanded(
              child: model.topupResult.body.isEmpty
                  ? ScreenMessage(
                      image: Icon(
                        Icons.not_interested_outlined,
                        color: Colors.red,
                        size: 130.0,
                      ),
                      label: "Tidak ada data",
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ID User/Tanggal",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Nominal",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Pilih Status",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.grey,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: model.topupResult.body.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(model.topupResult.body[index]
                                              .usersIdusers
                                              .toString()),
                                          Text(model
                                              .topupResult.body[index].waktu
                                              .toString())
                                        ],
                                      ),
                                      Text(
                                        _format.getRupiahCurrency(model
                                            .topupResult.body[index].jumlah),
                                        style: TextStyle(
                                            color: AppStyle.primaryColor,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RaisedButton(
                                            color: Colors.blue[900],
                                            padding: EdgeInsets.symmetric(
                                                vertical: 22.0),
                                            onPressed: () {
                                              model
                                                  .acceptTopUp(
                                                      model.topupResult
                                                          .body[index].idtopup
                                                          .toString(),
                                                      model
                                                          .topupResult
                                                          .body[index]
                                                          .usersIdusers
                                                          .toString(),
                                                      model.topupResult
                                                          .body[index].jumlah
                                                          .toString())
                                                  .then(
                                                      (ResponseModel response) {
                                                if (response.status != 0) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content:
                                                          Text(response.body),
                                                    ),
                                                  );
                                                } else {
                                                  model.getUnconfirm();
                                                }
                                              });
                                            },
                                            child: Center(
                                              child: Text(
                                                "TERIMA",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                          ),
                                          SizedBox(width: 16.0),
                                          OutlineButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 22.0),
                                            onPressed: () {
                                              model
                                                  .cancelTopup(model.topupResult
                                                      .body[index].idtopup
                                                      .toString())
                                                  .then(
                                                      (ResponseModel response) {
                                                if (response.status != 0) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content:
                                                          Text(response.body),
                                                    ),
                                                  );
                                                } else {
                                                  model.getUnconfirm();
                                                }
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            borderSide: BorderSide(
                                              color: AppStyle.primaryColor,
                                            ),
                                            child: Text(
                                              "TOLAK",
                                              style: TextStyle(
                                                  color: AppStyle.primaryColor),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                                /* ListTile(
                isThreeLine: true,
                leading: Text(_tanggal[index]),
                title: Text(
                      "Rp. " + _nominal[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("flyme.yusuf@gmail.com"),
                trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RaisedButton(
                          color: Colors.blue[900],
                          padding: EdgeInsets.symmetric(vertical: 22.0),
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "TERIMA",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        OutlineButton(
                          padding: EdgeInsets.symmetric(vertical: 22.0),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          borderSide: BorderSide(
                            color: AppStyle.primaryColor,
                          ),
                          child: Text(
                            "TOLAK",
                            style: TextStyle(color: AppStyle.primaryColor),
                          ),
                        )
                      ],
                ),
              ), */
                                );
                          },
                        ),
                      ],
                    ),
            ),
    );
  }
}
