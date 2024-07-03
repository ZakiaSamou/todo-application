import 'package:flutter/material.dart';
import 'package:flutter_todo_app/domain/home_controller.dart';
import 'package:flutter_todo_app/ui/pages/add_task/add_tasl_page.dart';
import 'package:flutter_todo_app/ui/pages/new_task_page/new_task_page.dart';
import 'package:flutter_todo_app/ui/widgets/Small_text.dart';
import 'package:flutter_todo_app/ui/widgets/big_text.dart';
import 'package:flutter_todo_app/ui/widgets/default_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// هي الصفحة هي تبويبة من الواجهة الهوم فبلشناها بعمود
class DoneTaskPage extends StatelessWidget {
  DoneTaskPage({super.key});
  HomeController controller = Get.put(HomeController());
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    //'$date',
                    '${DateFormat.yMMMd().format(date)}',
                    // '10/10/2024',
                    size: 24,
                    weight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  BigText(
                    'Today',
                    size: 28,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              DefaultButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AddTaskPage();
                    }));
                  },
                  text: '+ Add Task')
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.doneTask.length,
                itemBuilder: (context, index) {
                  return taskItem(model: controller.doneTask[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
