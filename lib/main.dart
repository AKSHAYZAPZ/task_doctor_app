import 'package:doctors_app/routes/routes.dart';
import 'package:doctors_app/screens/doctor_screen/view/doctor_screen.dart';
import 'package:doctors_app/screens/search_screen/view/search_screen.dart';
import 'package:doctors_app/screens/splash_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_pages/app_pages.dart';
import 'app_themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: GetMaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Doctors App',
        getPages: AppPages.appPages,
        initialRoute: AppRoute.splash,
      ),
    );
  }
}
