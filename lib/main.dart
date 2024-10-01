import 'dart:io';

import 'package:film_mela/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Helper/color.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.background,
          scaffoldBackgroundColor: AppColors.background,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: AppColors.text),
            bodyMedium: TextStyle(color: AppColors.text),
            bodySmall: TextStyle(color: AppColors.text),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.appBarBackground,
            titleTextStyle:
                TextStyle(color: AppColors.appBarText, fontSize: 20),
            iconTheme: IconThemeData(color: AppColors.iconColor),
          ),
          iconTheme: const IconThemeData(color: AppColors.iconColor),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.buttonTextWhite,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.buttonBackgroundBlack;
                }
                return AppColors.buttonBackgroundWhite;
              }),
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.buttonTextWhite;
                }
                return AppColors.buttonTextBlack;
              }),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.buttonBackgroundWhite;
                }
                return AppColors.buttonTextBlack;
              }),
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.buttonTextBlack;
                }
                return AppColors.buttonTextWhite;
              }),
            ),
          )),
      home: const HomeScreen(),
    );
  }
}
