// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:random_video_chat_app/controllers/doctor_edit_profile_controller.dart';
//
// class DoctorDrawer extends StatelessWidget {
//   final DoctorDrawerController _doctorDrawerController =
//   Get.find<DoctorDrawerController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Obx(
//             () => ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(_doctorDrawerController.doctor.value.name ?? ''),
//               accountEmail: Text(_doctorDrawerController.doctor.value.email ?? ''),
//               currentAccountPicture: CircleAvatar(
// /*
//                 backgroundImage: NetworkImage(_doctorDrawerController.doctor.value.profileImageUrl ?? ''),
// */
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: _doctorDrawerController.logout,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
