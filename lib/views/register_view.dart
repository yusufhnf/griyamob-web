import 'package:flutter/material.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:griyaadmin/utils/validation.dart';
import 'package:griyaadmin/viewmodels/register_viewmodel.dart';
import 'package:griyaadmin/widgets/bottomsheet_message.dart';
import 'package:griyaadmin/widgets/rounded_textfield.dart';
import 'package:line_icons/line_icons.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget with Validation {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      onModelReady: (model) => model.initial(),
      builder: (context, model, child) => Scaffold(
          body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Daftar sebagai GriyaAdmin",
                  style: TextStyle(
                      color: AppStyle.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: RoundedTextField(
                      controller: model.fullnameUser,
                      label: "Nama Lengkap",
                      // controller: model.fullnameUser,
                      icon: LineIcons.user,
                      validator: (value) => validateName(value),
                      obsecureText: false),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: RoundedTextField(
                      controller: model.positionUser,
                      label: "Posisi",
                      // controller: model.phoneUser,
                      icon: LineIcons.users,
                      inputType: TextInputType.number,
                      validator: (value) => validateName(value),
                      obsecureText: false),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: RoundedTextField(
                      controller: model.emailUser,
                      label: "Email",
                      // controller: model.emailUser,
                      icon: LineIcons.at,
                      inputType: TextInputType.emailAddress,
                      validator: (value) => validateEmail(value),
                      obsecureText: false),
                ),
                SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: RoundedTextField(
                      controller: model.passUser,
                      label: "Password",
                      // controller: model.passUser,
                      icon: LineIcons.lock,
                      validator: (value) => validatePassword(value),
                      obsecureText: true),
                ),
                SizedBox(height: 30.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    padding: EdgeInsets.symmetric(vertical: 22.0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model.register().then((ResponseModel response) {
                          if (response.status != 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(response.body),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Registrasi Sukses"),
                              ),
                            );
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false);
                          }
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text("Registrasi Gagal: Terjadi Kesalahan"),
                            ),
                          );
                        });
                      }
                    },
                    child: Center(
                      child: Text(
                        "DAFTAR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Text("Sudah punya akun?"),
                SizedBox(height: 15.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: OutlineButton(
                    padding: EdgeInsets.symmetric(vertical: 22.0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "KEMBALI KE HALAMAN LOGIN",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
