import 'package:flutter/material.dart';
import 'package:griyaadmin/configs/shared_preferences.dart';
import 'package:griyaadmin/models/response_model.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:griyaadmin/utils/validation.dart';
import 'package:griyaadmin/viewmodels/login_viewmodel.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget with Validation {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => null,
      builder: (context, model, child) => LoadingOverlay(
        isLoading: model.isBusy ? true : false,
        progressIndicator: LoadingBouncingLine.circle(
          backgroundColor: AppStyle.primaryColor,
        ),
        color: Colors.white,
        opacity: 0.9,
        child: Scaffold(
          body: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[900],
                      image: DecorationImage(
                          image: AssetImage('assets/griya-landing.png'),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Masuk GriyaAdmin",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 40.0),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                controller: model.emailUser,
                                validator: (value) => validateEmail(value),
                                decoration: InputDecoration(
                                    filled: true,
                                    prefixIcon: Icon(LineIcons.at,
                                        color: Colors.blue[900]),
                                    border: new OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    hintText: "Email",
                                    fillColor: Colors.grey[200]),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                controller: model.passUser,
                                validator: (value) => validatePassword(value),
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      LineIcons.lock,
                                      color: Colors.blue[900],
                                    ),
                                    filled: true,
                                    border: new OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    hintText: "Password",
                                    fillColor: Colors.grey[200]),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: RaisedButton(
                                color: Colors.blue[900],
                                padding: EdgeInsets.symmetric(vertical: 22.0),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    model
                                        .login()
                                        .then((ResponseModel response) async {
                                      if (response.status != 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(response.body),
                                          ),
                                        );
                                      } else {
                                        await UserSharedPreference.setUser(
                                            response.body.toString());
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/dashboard',
                                            (route) => false);
                                      }
                                    }).catchError((error) {
                                      print(error);
                                    });
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "MASUK",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                child: OutlineButton(
                                  padding: EdgeInsets.symmetric(vertical: 22.0),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text(
                                    "DAFTAR",
                                    style: TextStyle(color: Colors.blue[900]),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.blue[900]),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
