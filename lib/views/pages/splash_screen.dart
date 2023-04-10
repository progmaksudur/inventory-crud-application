import 'package:flutter/material.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="/splashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:AppCustomText(text: "Inventory Management" ,),
      ),
    );
  }
}
