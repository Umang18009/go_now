import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_now/splash_screnn.dart';

void main() {
  runApp(GetMaterialApp(
    home: const SplashScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedLabelStyle: TextStyle(color: Colors.white))
    ),
  ));
}
