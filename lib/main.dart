
import 'package:flutter/material.dart';
import 'package:test_app/core/di/dependency_injection.dart' ;
import 'package:test_app/core/routing/app_router.dart';
import 'package:test_app/test_app.dart';

void main() async {
  setupGetIt();
  runApp(TestApp(
    appRouter: AppRouter(),
  ));
}
