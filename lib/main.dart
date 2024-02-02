import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_issues_app/core/utils/initial_bindings.dart';
import 'package:github_issues_app/presentation/home_screen/view/home_screen.dart';
import 'package:github_issues_app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Tracker',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
      home: Builder(builder: (context) {
        return const HomeScreen();
      }),
    );
  }
}
