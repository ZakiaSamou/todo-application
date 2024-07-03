// import 'package:flutter/material.dart';
// import 'package:flutter_todo_app/domain/home_controller.dart';
// import 'package:get/get.dart';

// class CounterPage extends StatelessWidget {
//   CounterPage({super.key});

//   ///////------------------حتى يتم تفغيل الgetx-----------------//////
//   HomeController controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//           IconButton(
//               onPressed: () {
//                 controller.removeNumber();
//               },
//               icon: Icon(
//                 Icons.remove,
//                 size: 40,
//               )),
//           GetBuilder<HomeController>(
//               init: HomeController(),
//               builder: (HomeController v) {
//                 return Text(
//                   "   ${v.n}   ",
//                   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                 );
//               }),
//           IconButton(
//               onPressed: () {
//                 controller.addNumber();
//               },
//               icon: Icon(
//                 Icons.add,
//                 size: 40,
//               ))
//         ]),
//       ),
//     );
//   }
// }
