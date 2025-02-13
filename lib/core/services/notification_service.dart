import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotifications() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> requestPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel',
      'Default Notifications',
      channelDescription: 'This is the default notification channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'scheduled_channel',
          'Scheduled Notifications',
          channelDescription: 'Channel for scheduled notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  // static Future<void> startRecurringNotification() async {
  //   await _notificationsPlugin.periodicallyShow(
  //     1,
  //     'Time to visit us again!',
  //     _getTimeSinceLastVisitMessage(),
  //     RepeatInterval
  //         .everyMinute,
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'recurring_channel',
  //         'Recurring Notifications',
  //         channelDescription: 'Reminders to visit the restaurant',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       ),
  //     ),
  //   );
  // }

  // static String _getTimeSinceLastVisitMessage() {
  //   final storage = GetStorage();
  //   final lastVisit =
  //       storage.read('last_visit_time') ?? DateTime.now().toIso8601String();
  //   final lastVisitTime = DateTime.parse(lastVisit);
  //   final duration = DateTime.now().difference(lastVisitTime);

  //   return 'It has been ${duration.inMinutes} minutes since your last visit!';
  // }

  // static void saveVisitTime() {
  //   final storage = GetStorage();
  //   storage.write('last_visit_time', DateTime.now().toIso8601String());
  // }
}
