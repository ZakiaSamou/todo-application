import 'package:flutter_todo_app/data/local/sqflite_call.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // int n = 0;
  // void addNumber() {
  //   n++;
  //   update();
  // }

  // void removeNumber() {
  //   n--;
  //   update();
  // }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    SqfliteCall.createBatabaseAndTable();
    super.onReady();
  }

  var newTask = [].obs;
  var doneTask = [].obs;
  int selectTap = 0;
  //رح نستخدم get builder
  void changePage(int index) {
    selectTap = index;
    update();
  }

  void taskValue(List<Map<String, dynamic>> value) {
    newTask.value = [];
    doneTask.value = [];
    value.forEach((element) {
      element['status'] == 'new' ? newTask.add(element) : doneTask.add(element);
    });
    // newTask.value = value;
  }
}
