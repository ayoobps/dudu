import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dudu/banner-images/view/banner_image_screen.dart';
import 'package:dudu/view/video_player_screen.dart';
import 'package:dudu/view/project_sensor.dart';
import 'package:dudu/view/cpanel_php_connection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Set your design size
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          home: BannerImageScreen(),
        );
      },
    );
  }
}