import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Noti{
  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('mipmap/bccf');
    DarwinInitializationSettings initializationDrawinSettings = const DarwinInitializationSettings();
    var initializationsSettings = InitializationSettings(android: androidInitialize , iOS: initializationDrawinSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  static Future showNotifications(
    {
      var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
    }
  ) async {
    AndroidNotificationDetails androidNotificationDetails  = const AndroidNotificationDetails('chid', 'chname' , playSound:true ,importance: Importance.max , priority: Priority.high );
    var drawinDetails = const DarwinNotificationDetails(
      presentSound: false
    );

    var not = NotificationDetails(android: androidNotificationDetails , iOS: drawinDetails);

    await flutterLocalNotificationsPlugin.show(id, title, body, not);

  }
}