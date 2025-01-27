import 'package:flutter/material.dart';
import 'package:hh_refresh/app.dart';
import 'package:hh_refresh/di/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.registerAppModule();
  runApp(App());
}
