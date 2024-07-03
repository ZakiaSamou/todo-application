import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/theme_controller.dart';
import 'package:flutter_todo_app/ui/counter_page.dart';
import 'package:flutter_todo_app/ui/layout/home_layout.dart';
import 'package:flutter_todo_app/ui/style/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeController controller = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        init: ThemeController(),
        builder: (c) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: c.isLight ? ThemeMode.light : ThemeMode.dark,
              home: HomeLayout(),
              //  home: CounterPage(),
            ));
  }
}
