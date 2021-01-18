import 'package:flutter/material.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingLine.circle(
        backgroundColor: AppStyle.primaryColor,
      ),
    );
  }
}
