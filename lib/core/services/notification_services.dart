// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initNotification() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       onDidReceiveLocalNotification:
//           (int id, String? title, String? body, String? payload) async {},
//     );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse:
//           (NotificationResponse notificationResponse) async {},
//     );
//   }

//   Future<NotificationDetails> notificationDetails() async {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channelId',
//         'channelName',
//         channelDescription: 'channelDescription',
//         importance: Importance.max,
//         priority: Priority.high,
//         icon: '@mipmap/ic_launcher',
//       ),
//       iOS: DarwinNotificationDetails(),
//     );
//   }

//   Future<void> showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async {
//     return flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       await notificationDetails(),
//     );
//   }

//   Future<void> scheduleNotification({
//     required DateTime dateTime,
//     required int id,
//     String? title,
//     String? body,
//     String? payload,
//     String? customSound,
//     DateTimeComponents? matchDateTimeComponents,
//   }) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(dateTime, tz.local),
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           customSound ?? "channel1",
//           "channel1",
//           icon: "@mipmap/ic_launcher",
//           importance: Importance.max,
//           priority: Priority.max,
//           playSound: true,
//           sound: customSound == null
//               ? null
//               : RawResourceAndroidNotificationSound(customSound),
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: matchDateTimeComponents,
//       payload: payload,
//     );
//     debugPrint(
//         'notification $id - $title scheduled at ${dateTime.toIso8601String()}');
//   }

//   Future<void> _requestPermission() async {
//     if (Platform.isAndroid) {
//       flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()!
//           .requestNotificationsPermission();
//     } else if (Platform.isIOS) {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()!
//           .requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//             critical: true,
//           );
//     }
//   }

//   Future<void> sendImmediateNotification() async {
//     NotificationService notificationService = NotificationService();

//     // تأكد من تهيئة الإشعارات وطلب الإذن قبل إرسال الإشعار
//     await notificationService.initNotification();
//     await notificationService._requestPermission();

//     // إرسال الإشعار مباشرة
//     await notificationService.showNotification(
//       id: 1, // يمكنك تغيير الـ id كما تريد
//       title: "عنوان الإشعار",
//       body: "هذا هو محتوى الإشعار",
//     );
//   }
// }

// Future<void> setupNotifications() async {
//   NotificationService notificationService = NotificationService();

//   await notificationService.initNotification();
//   await notificationService._requestPermission();
// }
