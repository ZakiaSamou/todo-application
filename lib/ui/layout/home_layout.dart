import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_todo_app/data/local/sqflite_call.dart';
import 'package:flutter_todo_app/domain/home_controller.dart';
import 'package:flutter_todo_app/domain/theme_controller.dart';
import 'package:flutter_todo_app/ui/pages/done_task_page/done_task_page.dart';
import 'package:flutter_todo_app/ui/pages/new_task_page/new_task_page.dart';
import 'package:flutter_todo_app/ui/style/colors/app_colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';



class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  HomeController controller = Get.put(HomeController());
  ThemeController controller1 = Get.find<ThemeController>();
  List<Widget> pages = [
    NewTaskPage(),
    DoneTaskPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (HomeController c) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Done',
            ),
          ],
          currentIndex: c.selectTap,
          onTap: (index) {
            //  setState(() {
            // selectTap = index;
            //  });
            c.changePage(index);
          },
        ),
        appBar: AppBar(
          leading: GetBuilder(
            init: ThemeController(),
            builder: (c) => IconButton(
              onPressed: () {
                c.switchTheme();
              },
              icon: Icon(
                c.isLight ? Icons.light_mode : Icons.dark_mode,
                color: AppColors.textColor,
                size: 30,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
                size: 30,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
        body: pages[c.selectTap],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.edit),
        ),
      );
    });
  }
}
