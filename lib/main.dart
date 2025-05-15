import 'package:flutter/material.dart';
import 'package:foxbit_hiring_test_template/app/application.dart';
import 'package:foxbit_hiring_test_template/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize dependency injection
  setupDI();

  runApp(FoxbitApp());
}
