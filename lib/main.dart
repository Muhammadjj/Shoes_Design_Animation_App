import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes_app_firebase/utils/constants.dart';
import 'package:shoes_app_firebase/view/navigator.dart';

void main() {
  runApp(const ShoesApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppConstantsColor.backgroundColor,
  ));
}

class ShoesApp extends StatelessWidget {
  const ShoesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shoes App Design',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: AppConstantsColor.backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainNavigator());
  }
}
