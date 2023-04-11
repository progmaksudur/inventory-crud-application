import 'package:flutter/material.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class AppCustomProfileCards extends StatelessWidget {
  final String title;
  final String value;
  const AppCustomProfileCards({required this.title,required this.value,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 1,child: AppCustomText(text: title,textStyle: AppConstTextStyle.normalText16w500,)),
      AppCustomText(text: ":   "),
      Expanded(flex: 3,child: AppCustomText(text: value,textStyle: AppConstTextStyle.normalText18,)),
    ]);
  }
}
