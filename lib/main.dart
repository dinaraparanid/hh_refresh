import 'package:flutter/material.dart';
import 'package:hh_refresh/app.dart';
import 'package:hh_refresh/di/app_module.dart';
import 'package:hh_refresh/platform/timezone.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.registerAppModule();
  initializeTimeZones();
  runApp(App());
}
