import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(initializationSettings);
  }

  static Future<void> scheduleNotification(
      int id, String title, String body, DateTime scheduledDate) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id', // تأكد من تطابق هذه القيم مع إعدادات القناة
      'channel_name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.high,
      fullScreenIntent: true, // هذا يعرض الإشعار كنافذة كاملة
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
    );

    // تحويل DateTime إلى TZDateTime
    final tzDateTime = tz.TZDateTime.from(scheduledDate, tz.local);

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tzDateTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
// <manifest xmlns:android="http://schemas.android.com/apk/res/android">
//     <application
//         android:label="game_store"
//         android:name="${applicationName}"
//         android:icon="@mipmap/ic_launcher">
//         <activity
//             android:name=".MainActivity"
//             android:exported="true"
//             android:launchMode="singleTop"
//             android:theme="@style/LaunchTheme"
//             android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
//             android:hardwareAccelerated="true"
//             android:windowSoftInputMode="adjustResize">
//             <!-- Specifies an Android theme to apply to this Activity as soon as
//                  the Android process has started. This theme is visible to the user
//                  while the Flutter UI initializes. After that, this theme continues
//                  to determine the Window background behind the Flutter UI. -->
//             <meta-data
//               android:name="io.flutter.embedding.android.NormalTheme"
//               android:resource="@style/NormalTheme"
//               />
//             <intent-filter>
//                 <action android:name="android.intent.action.MAIN"/>
//                 <category android:name="android.intent.category.LAUNCHER"/>
//             </intent-filter>
//         </activity>
//         <!-- Don't delete the meta-data below.
//              This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
//         <meta-data
//             android:name="flutterEmbedding"
//             android:value="2" />
//     </application>
//     <!-- Required to query activities that can process text, see:
//          https://developer.android.com/training/package-visibility?hl=en and
//          https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

//          In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
//     <queries>
//         <intent>
//             <action android:name="android.intent.action.PROCESS_TEXT"/>
//             <data android:mimeType="text/plain"/>
//         </intent>
//     </queries>
//        <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
//        <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>

// </manifest>
