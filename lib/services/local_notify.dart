import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:portal_corp_v2/services/push.notify.dart';

import '../screens/CentroNotificacion/components/detalle-notidy.dart';

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();
const InitializationSettings initsetings = InitializationSettings(
    android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

class Notifications {
  static final _notify = FlutterLocalNotificationsPlugin();

  @pragma('vm:entry-point')
  static initialize() {
    _notify.initialize(initsetings,
        onDidReceiveNotificationResponse: ((details) {
      bool ifdetalle = false;
      if (data == "Detalle") {
        ifdetalle = false;
        print('$data');
      } else {
        ifdetalle = true;
        print('$data');
      }
      navigatorKeyGlobal.currentState?.push(MaterialPageRoute(
          builder: (contextGlobal) => MyNotify(
                notify: ifdetalle,
              )));
      print("YEEEEEEEEEEE ");
      print("Hola has abierto la notificaion: {$details!.input}");
    }),
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveBackgroundNotificationResponse);
  }

  static onDidReceiveBackgroundNotificationResponse(
      NotificationResponse details) {
    print("Hola has abierto la notificaion");
    details.payload;
  }

  static Future showNotification(
          {int id = 0, String? title, String? body, String? payload}) async =>
      _notify.show(
          id,
          title,
          body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: initializationSettingsAndroid.defaultIcon,
              ),
              iOS: const DarwinNotificationDetails()),
          payload: payload);
}
