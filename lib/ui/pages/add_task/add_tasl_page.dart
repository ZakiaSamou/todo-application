import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/local/sqflite_call.dart';
import 'package:flutter_todo_app/data/model/task_model.dart';
import 'package:flutter_todo_app/domain/home_controller.dart';
import 'package:flutter_todo_app/ui/layout/home_layout.dart';
import 'package:flutter_todo_app/ui/style/colors/app_colors.dart';
import 'package:flutter_todo_app/ui/widgets/big_text.dart';
import 'package:flutter_todo_app/ui/widgets/default_button.dart';
import 'package:flutter_todo_app/ui/widgets/my_text_feild.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  List<TextEditingController> controllers = [
    //title
    TextEditingController(),
    //Note
    TextEditingController(),
    //Date
    TextEditingController(
      text: DateFormat.yMd().format(DateTime.now()),
    ),
    //Start time
    TextEditingController(),
    //End time
    TextEditingController(),
    //Remind
    TextEditingController(text: '5'),
    //Repeat
    TextEditingController(text: 'None'),
  ];

  int selectColor = 0;
  //أول مكان للاستدعاء
  HomeController controller = Get.put(HomeController());
  List<String> remindList = ['5', '10', '15', '20'];
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 28,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            BigText('Add Task'),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                MyTextField(
                  controller: controllers[0],
                  title: 'Title',
                  hint: 'Type Title Here',
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: controllers[1],
                  title: 'Note',
                  hint: 'Type Note Here',
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: controllers[2],
                  title: 'Date',
                  type: TextInputType.none,
                  hint: DateFormat.yMd().format(DateTime.now()),
                  suffix: IconButton(
                    //   onPressed: () async{
                    //  DateTime? dateTime= await  showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(2020),
                    //         lastDate: DateTime(2030));
                    //   },
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030))
                          .then((value) {
                        controllers[2].text = DateFormat.yMd().format(value!);
                      }).catchError((e) {
                        print(e.toString());
                      });
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextField(
                        controller: controllers[3],
                        title: 'Start Time',
                        hint: TimeOfDay.now().format(context),
                        type: TextInputType.none,
                        suffix: IconButton(
                          onPressed: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((value) {
                              controllers[3].text = value!.format(context);
                            }).catchError((e) {
                              print(e.toString());
                            });
                          },
                          icon: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: MyTextField(
                      controller: controllers[4],
                      title: 'End Time',
                      hint: TimeOfDay.now().format(context),
                      type: TextInputType.none,
                      suffix: IconButton(
                        onPressed: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            controllers[4].text = value!.format(context);
                          }).catchError((e) {
                            print(e.toString());
                          });
                        },
                        icon: Icon(Icons.access_time),
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: controllers[5],
                  title: 'Remind',
                  hint: '5',
                  suffix: DropdownButton(
                    padding: EdgeInsets.only(left: 10),
                    borderRadius: BorderRadius.circular(12),
                    items: remindList.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        value: e,
                      );
                    }).toList(),
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (newRemind) {
                      setState(() {
                        controllers[5].text = newRemind!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: controllers[6],
                  title: 'Repeat',
                  hint: 'None',
                  suffix: DropdownButton(
                    padding: EdgeInsets.only(left: 10),
                    borderRadius: BorderRadius.circular(12),
                    items: repeatList.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        value: e,
                      );
                    }).toList(),
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (newRepeat) {
                      setState(() {
                        controllers[6].text = newRepeat!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                    spacing: 5,
                    children: List.generate(
                      3,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectColor = index;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0
                                ? AppColors.primaryColor
                                : index == 1
                                    ? Colors.pink[800]
                                    : Colors.amber[800],
                          ),
                          child: selectColor == index
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Container(),
                        ),
                      ),
                    )),
                DefaultButton(
                  onTap: () {
                    if (controllers[0].text.isEmpty ||
                        controllers[1].text.isEmpty ||
                        controllers[3].text.isEmpty ||
                        controllers[4].text.isEmpty) {
                      print('message : forms empty');
                    } else {
                      SqfliteCall.insertData(
                        model: TaskModel(
                          title: controllers[0].text,
                          note: controllers[1].text,
                          date: controllers[2].text,
                          startTime: controllers[3].text,
                          endTime: controllers[4].text,
                          remind: controllers[5].text,
                          repeat: controllers[6].text,
                          color: selectColor,
                        ),
                      ).then((value) {
                        //////////////very Important to update data//////////////////
                        SqfliteCall.getData(SqfliteCall.database!);
                        //////////////very Important to update data//////////////////
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeLayout(),
                          ),
                          (route) => false,
                        );
                      });
                    }
                  },
                  text: 'Create Task',
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
