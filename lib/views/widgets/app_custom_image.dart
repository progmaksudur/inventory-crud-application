import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomImage extends StatelessWidget {
  final String imageUrl;

  const AppCustomImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover, // adjust the image's size and aspect ratio to fit the container
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {

        return doesFileExist(imageUrl)==true?Image.file(File(imageUrl)):Icon(Icons.error,size: 25.sp,);
      },
    );
  }
  //Using For Check file
  bool doesFileExist(String imageUrl) {
    File file = File(imageUrl);
    return file.existsSync();
  }
}