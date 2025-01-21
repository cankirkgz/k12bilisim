import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k12bilisimapp/routes/app_pages.dart';
import 'package:k12bilisimapp/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}
