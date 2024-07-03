import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/local/sqflite_call.dart';
import 'package:flutter_todo_app/domain/home_controller.dart';
import 'package:flutter_todo_app/ui/layout/home_layout.dart';
import 'package:flutter_todo_app/ui/pages/add_task/add_tasl_page.dart';
import 'package:flutter_todo_app/ui/style/colors/app_colors.dart';
import 'package:flutter_todo_app/ui/widgets/Small_text.dart';
import 'package:flutter_todo_app/ui/widgets/big_text.dart';
import 'package:flutter_todo_app/ui/widgets/default_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// هي الصفحة هي تبويبة من الواجهة الهوم فبلشناها بعمود
class NewTaskPage extends StatelessWidget {
  NewTaskPage({super.key});
  DateTime date = DateTime.now();
  HomeController controller = Get.put(HomeController());
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
                itemCount: controller.newTask.length,
                itemBuilder: (context, index) {
                 
                  return taskItem(model: controller.newTask[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget taskItem({required Map<String, dynamic> model}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: InkWell(
      onTap: () {
        Get.bottomSheet(Container(
          width: double.infinity,
          color: Colors.white,
          height: Get.height * 0.33,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Column(children: [
              Container(
                height: 5,
                width: 70,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              model['status'] == 'NEW'
                  ? DefaultButton(
                      onTap: () {
                        SqfliteCall.updateData(
                                newStatus: "Complete", id: model['id'])
                            .then((value) {
                          SqfliteCall.getData(SqfliteCall.database!);
                          Get.back();
                        });
                      },
                      text: 'Complete',
                      color: AppColors.primaryColor,
                      width: double.infinity,
                      height: 55,
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              DefaultButton(
                onTap: () {
                  SqfliteCall.deleteData(model['id']).then((value) {
                    SqfliteCall.getData(SqfliteCall.database!);
                    Get.back();
                  });
                },
                text: 'Delete',
                color: Colors.red,
                width: double.infinity,
                height: 55,
              ),
              Spacer(),
              DefaultButton(
                onTap: () {
                  Get.back();
                },
                text: 'Close',
                color: Colors.grey[500]!,
                width: double.infinity,
                height: 55,
              ),
            ]),
          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 17),
        decoration: BoxDecoration(
          // color: AppColors.primaryColor,
          color: model['color'] == 0
              ? AppColors.primaryColor
              : model['color'] == 1
                  ? Colors.pink[900]
                  : Colors.orange[700],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  model['title'],
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey[100],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    SmallText(
                      model['start_time'],
                      size: 16,
                      weight: FontWeight.w500,
                      color: Colors.grey[100]!,
                    ),
                    SmallText(
                      ' - ${model['end_time']}',
                      size: 16,
                      weight: FontWeight.w500,
                      color: Colors.grey[100]!,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                SmallText(
                  '  ${model['note']}',
                  color: Colors.grey[100]!,
                  size: 16,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: 1.5,
                  color: Colors.grey[200],
                ),
                SizedBox(
                  width: 10,
                ),
                RotatedBox(
                  quarterTurns: 3,
                  child: SmallText(
                    model['status'] == 'new' ? 'TODO' : 'COMPLETE',
                    weight: FontWeight.w500,
                    size: 13,
                    color: Colors.grey[50]!,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
