import 'app/core/routes/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    onGenerateRoute: AppRoute.routes,
  ));
}
