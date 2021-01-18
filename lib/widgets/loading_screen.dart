import 'package:flutter/material.dart';
import 'package:griyaadmin/utils/app_style.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.isLoading, this.child});
  final bool isLoading;
  final Widget child;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: widget.isLoading,
      child: widget.child,
      progressIndicator: LoadingBouncingLine.circle(
        backgroundColor: AppStyle.primaryColor,
      ),
      color: Colors.white,
      opacity: 0.8,
    );
  }
}
