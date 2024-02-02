import 'package:get/route_manager.dart';
import 'package:github_issues_app/presentation/home_screen/view/home_screen.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';
  static const String initialRoute = '/home_screen';

  static List<GetPage> pages = [
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: initialRoute, page: () => const HomeScreen()),
  ];
}
