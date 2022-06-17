import 'package:flutter/material.dart';
import 'app/core/routes/app_route.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    onGenerateRoute: AppRoute.routes,
  ));
}
