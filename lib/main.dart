import 'package:ezy_travel/res/app_colors.dart';
import 'package:ezy_travel/services/init_contollers.dart';
import 'package:ezy_travel/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitializeControllers.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ezy travel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
