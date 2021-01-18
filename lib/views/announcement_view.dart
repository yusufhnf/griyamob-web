import 'package:flutter/material.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/utils/validation.dart';
import 'package:griyaadmin/viewmodels/announcement_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AnnouncementView extends StatelessWidget with Validation {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: ViewModelBuilder<AnnouncementViewModel>.reactive(
          viewModelBuilder: () => AnnouncementViewModel(),
          onModelReady: (model) => null,
          builder: (context, model, child) => Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: model.textTitle,
                    validator: (value) => validateField(value),
                    decoration: InputDecoration(
                        filled: true,
                        border: new OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintText: "Judul Pengumuman",
                        fillColor: Colors.grey[200]),
                  ),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    controller: model.textDetail,
                    validator: (value) => validateField(value),
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
                        hintText: "Detail Pengumuman",
                        fillColor: Colors.grey[200]),
                  ),
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
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response.body),
                              ),
                            );
                            model.resetText();
                          } else {
                            Scaffold.of(context).showSnackBar(
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
                ),
              ],
            ),
          ),
        ));
  }
}
