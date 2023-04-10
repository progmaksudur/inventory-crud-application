import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';

class AppCustomText extends StatelessWidget {
  String? text;
  TextStyle? textStyle;
  TextAlign? textAlign;
  int? maxLine;
  AppCustomText({this.text,this.maxLine,this.textAlign,this.textStyle,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text??"",style:GoogleFonts.poppins(textStyle: textStyle??AppConstTextStyle.normalText),textAlign:textAlign??TextAlign.start,maxLines: maxLine ?? null,);
  }
}
