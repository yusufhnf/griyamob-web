import 'package:flutter/material.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:griyaadmin/utils/validation.dart';
import 'package:griyaadmin/viewmodels/promo_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PromoView extends StatelessWidget with Validation {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: ViewModelBuilder<PromoViewModel>.reactive(
          viewModelBuilder: () => PromoViewModel(),
          onModelReady: (model) => model.initial(),
          builder: (context, model, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: model.textTitle,
                    decoration: InputDecoration(
                        filled: true,
                        border: new OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintText: "Judul Promo",
                        fillColor: Colors.grey[200]),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: model.textDetail,
                    minLines: 8,
                    maxLines: 10,
                    decoration: InputDecoration(
                        filled: true,
                        border: new OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintText: "Detail Promo",
                        fillColor: Colors.grey[200]),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Switch(
                      value: model.isAnnouncement,
                      onChanged: (bool value) {
                        model.changeStatus(value);
                      },
                      activeTrackColor: Colors.blue[800],
                      activeColor: AppStyle.primaryColor,
                    ),
                    SizedBox(width: 15.0),
                    Text("Bagikan Notifikasi"),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    padding: EdgeInsets.symmetric(vertical: 22.0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model.post().then((ResponseModel response) async {
                          if (response.status != 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response.body),
                              ),
                            );
                            model.resetText();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response.body),
                              ),
                            );
                          }
                        });
                      }
                    },
                    child: Center(
                      child: Text(
                        "PUBLISH",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}