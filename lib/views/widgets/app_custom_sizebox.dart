import 'package:flutter/material.dart';

class AppCustomSizeBox extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
   AppCustomSizeBox({this.height,this.width,this.child,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }
}
