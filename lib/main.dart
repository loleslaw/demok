import 'package:demok/20_controllers/pages_controller.dart';
import 'package:demok/20_controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '10_views/11_stack/00_stack_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<PagesController>(PagesController());
  Get.put<UserController>(UserController());
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DEMOK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StackPage(),
    );
  }
}