// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tourist_guide/core/utils/app_colors.dart';
// import 'package:tourist_guide/core/utils/app_text_styles.dart';
// import 'package:tourist_guide/features/comment/presentation/blocs/bloc/comment_bloc.dart';

// import '../../../../core/widgets/snackbar_message.dart';

// Future<void> showDeleteCommentConfirmationDialog(
//     BuildContext context, final String commentId) async {
//   final bloc = BlocProvider.of<CommentBloc>(context);

//   return showDialog<void>(
//     context: context,
//     barrierDismissible: true, // User must tap a button to confirm or cancel
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           'Confirm Delete Comment',
//           style: AppTextStyles.poppinsThinW6000style22,
//         ),
//         content: Text(
//           'Are you sure you want to delete comment?',
//           style:
//               AppTextStyles.poppinsBoldstyle18.copyWith(color: AppColors.black),
//         ),
//         actions: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(
//                         AppColors.black38.withOpacity(0.7))),
//                 child: Text('Cancel',
//                     style: AppTextStyles.poppinsBoldstyle16
//                         .copyWith(color: AppColors.green)),
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//               ),
//               ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(
//                         AppColors.black38.withOpacity(0.7))),
//                 child: Text('Delete',
//                     style: AppTextStyles.poppinsBoldstyle16
//                         .copyWith(color: AppColors.red)),
//                 onPressed: () async {
//                   bloc.add(
//                     DeleteCommentEvent(commentId: commentId),
//                   );

//                   // bloc.add(
//                   //   const RefreshCommentEvent(),
//                   // );
//                   Navigator.of(context).pop();
//                   final subscription = bloc.stream.listen((state) async {
//                     if (state is SuccessCommentState) {
//                       // إذا نجحت عملية التحديث، قم بتحديث التعليقات
//                       bloc.add(const RefreshCommentEvent());
//                       SnackBarMessage().showSuccessSnackBar(
//                           message: state.message, context: context);
//                       // أغلق النافذة بعد التحديث
//                     } else if (state is ErrorCommentState) {
//                       // تعامل مع خطأ التحديث هنا إذا لزم الأمر
//                       // على سبيل المثال: عرض رسالة خطأ للمستخدم
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(state.message)),
//                       );

//                       // أغلق النافذة بعد عرض رسالة الخطأ
//                     }
//                   });

//                   // إلغاء الاشتراك بعد الاستخدام
//                   await Future.delayed(Duration(seconds: 30));
//                   await subscription.cancel();
//                   // Close the dialog
//                 },
//               ),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }
