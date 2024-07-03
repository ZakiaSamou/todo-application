// open the database
import 'package:flutter_todo_app/data/model/task_model.dart';
import 'package:flutter_todo_app/domain/home_controller.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteCall {
  static HomeController controller = Get.find<HomeController>();
  static String dbName = 'todo.db';
  static String tableName = 'tasks';
  static Database? database;
  static void createBatabaseAndTable() async {
    database = await openDatabase(
      dbName,
      version: 1,
      onCreate: (Database db, int version) async {
        print('database created');
        // When creating the db, create the table
        await db
            .execute(
          'CREATE TABLE  $tableName(id INTEGER PRIMARY KEY, title TEXT,note TEXT,date TEXT, start_time TEXT,end_time TEXT,remind TEXT,repeat TEXT,color INTEGER, status TEXT)',
        )
            .then((value) {
          print('table created');
        }).catchError((e) {
          print(e.toString());
        });
      },
      onOpen: (database) {
        print('database opened');
        getData(database);
      },
    );
  }

  static Future insertData({required TaskModel model}) async {
    // Insert some records in a transaction
    await database!.transaction((txn) async {
      return await txn
          .rawInsert(
              'INSERT INTO $tableName(title, note, date,start_time,end_time,remind,repeat,color,status) VALUES("${model.title}", "${model.note}","${model.date}","${model.startTime}","${model.endTime}","${model.remind}","${model.repeat}",${model.color},"new")')
          .then((value) {
        print('$value row inserted');
      }).catchError((e) {
        print(e.toString());
      });
    });
  }

//List<Map<String, dynamic>> newTask = [];
  static getData(Database database) async {
    return await database.rawQuery('SELECT * FROM $tableName').then((value) {
      // newTask = value;
      controller.taskValue(value);
      print('tasks : ${controller.newTask}');
    }).catchError((e) {
      print(e.toString());
    });
  }

  static Future deleteData(int id) async {
    return await database!
        .rawDelete('DELETE FROM ${tableName} WHERE id =?', [id]).then((value) {
      print('$value deleted');
    }).catchError((e) {
      print(e.toString());
    });
  }

  static Future updateData({required String newStatus, required int id}) async {
    return await database!.rawUpdate(
        'UPDATE $tableName SET status = ? WHERE id = ?',
        [newStatus, id]).then((value) {
      print('$value updated');
    }).catchError((e) {
      print(e.toString());
    });
  }
}
