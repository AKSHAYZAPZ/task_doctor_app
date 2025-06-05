import 'package:get/get_navigation/src/routes/get_route.dart';
import '../routes/routes.dart';
import '../screens/doctor_screen/view/doctor_screen.dart';
import '../screens/search_screen/view/search_screen.dart';
import '../screens/splash_screen/view/splash_screen.dart';

class AppPages {
  static List<GetPage> appPages = <GetPage>[
    GetPage(
      name: AppRoute.splash,
      page: () =>  SplashScreen(),
    ),
    GetPage(
      name: AppRoute.search,
      page: () =>  DoctorSearchScreen(),
    ),
    GetPage(
      name: AppRoute.doctorDetails,
      page: () => DoctorDetailScreen(),
    )
  ];
}
