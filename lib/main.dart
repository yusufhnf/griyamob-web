import 'package:flutter/material.dart';
import 'package:griyaadmin/views/dashboard_view.dart';
import 'package:griyaadmin/views/login_view.dart';
import 'package:griyaadmin/views/register_view.dart';
import 'package:griyaadmin/views/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GriyaAdmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/dashboard': (context) => DashboardView(),
        '/login': (context) => LoginView(),
        '/splash': (context) => SplashView(),
        '/register': (context) => RegisterView(),
      },
      home: SplashView(),
    );
  }
}
