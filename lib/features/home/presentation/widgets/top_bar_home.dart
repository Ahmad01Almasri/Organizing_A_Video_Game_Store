// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:game_store/features/home/data/models/device_model.dart';
// import '../../../../core/theming/app_text_styles.dart';
// import '../../../../generated/l10n.dart';

// class TopBarHome extends StatelessWidget {
//   final Function(String) onFilterSelected;
//   final List<DeviceModel> device;

//   const TopBarHome({
//     super.key,
//     required this.onFilterSelected,
//     required this.device,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(
//         top: 12.0.h,
//         bottom: 12.h,
//       ),
//       child: Row(
//         children: [
//           Text(
//             S.of(context).title,
//             style: AppTextStyles.font20BlackBold.copyWith(fontSize: 25.sp),
//           ),
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               onFilterSelected(value);
//             },
//             icon: const Icon(
//               Icons.filter_list,
//               size: 30,
//             ),
//             itemBuilder: (context) => [
//               const PopupMenuItem(
//                 value: "All devices",
//                 child: Text("All devices"),
//               ),
//               const PopupMenuItem(
//                 value: "laptop",
//                 child: Text("laptop"),
//               ),
//               const PopupMenuItem(
//                 value: "computer",
//                 child: Text("computer"),
//               ),
//               const PopupMenuItem(
//                 value: "playstation",
//                 child: Text("playstation"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
