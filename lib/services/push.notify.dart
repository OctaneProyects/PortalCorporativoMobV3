//SHA1: D8:93:0B:8B:1D:B4:AC:16:15:BD:33:16:5D:C7:16:8E:A4:AB:02:94
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:portal_corp_v2/services/local_notify.dart';

var data;
GlobalKey<NavigatorState> navigatorKeyGlobal = GlobalKey<NavigatorState>();
var contextGlobal;

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _streamController = StreamController.broadcast();
  static Stream<String> get messagesStram => _streamController.stream;
  // static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  // static var context;

  @pragma('vm:entry-point')
  static Future _backgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();

    
    // print('background message ${message.notification!.title}');
    //  //_streamController.add(message.data["pantalla"]);
    //  data = message.data["pantalla"];

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      Notifications.showNotification(
           title: message.notification!.title, body: message.notification!.body);
      //_streamController.add(message.data["pantalla"]);
      
    }
    data = message.data["pantalla"];
    print("App Segundo plano");
    print("Datos: ${message.data["pantalla"]}");
    print(
        "Titulo: ${message.notification!.title}   Mensaje: ${message.notification!.body}");
  }

  @pragma('vm:entry-point')
  static Future _onMessageHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      Notifications.showNotification(
           title: message.notification!.title, body: message.notification!.body);
      //_streamController.add(message.data["pantalla"]);
      
    }
    data = message.data["pantalla"];
    print("App Abierta");
    print("Datos: ${message.data["pantalla"]}");
    print(
        "Titulo: ${message.notification!.title}   Mensaje: ${message.notification!.body}");
  }

  // static Future _onMessageOpenApp(RemoteMessage message) async {
  //   print('onMessageOpenApp Handler ${message.messageId}');
  // }

  static Future initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    
    Notifications.initialize();
    final token = await FirebaseMessaging.instance.getToken();
    print("Token: $token");
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    // FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    // Firebase local notification plugin
    await FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);


//Firebase messaging
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //Local Notifications
  }

  static closeStream(){
    _streamController.close();
  }
}
