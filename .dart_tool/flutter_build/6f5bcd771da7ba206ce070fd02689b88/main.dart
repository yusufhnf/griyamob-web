// @dart=2.7

import 'dart:ui' as ui;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:griyaadmin/generated_plugin_registrant.dart';
import 'package:griyaadmin/main.dart' as entrypoint;

Future<void> main() async {
  registerPlugins(webPluginRegistry);
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
