import 'package:note_app/views/settings/settings_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:note_app/routes/route_names.dart';
import 'package:note_app/views/auth/login/login.dart';
import 'package:note_app/views/auth/register/register.dart';
import 'package:note_app/views/home/home_screen.dart';
import 'package:note_app/views/splash/splash_screen.dart';



class RouteDestinations {
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteNames.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: RouteNames.settingScreen,
      page: () => const Test(),
    ),
  
  ];
}
