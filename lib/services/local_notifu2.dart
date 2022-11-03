// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'dart:io' show Site, Platform;

// import 'package:rxdart/rxdart.dart';

// class NotificationPlugin {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   final BehaviorSubject<ReviceNotification> onDidReceiveLocalNotification = BehaviorSubject<ReviceNotification>();
//   var initializationSettings;
//   NotificationPlugin._() {
//     init();
//   }

//   init() async {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     if (Platform.isIOS) {
//       _requestIOSPermission();
//     }
//     initializePlatformSpecifics();
//   }

//   initializePlatformSpecifics(){
//     var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

//     var initializationSettingsIOS = IOSInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: false,
//       onDidReceiveLocalNotification:  (id, title, body, payload) async{
//         //
//         ReviceNotification recievedNotification = ReviceNotification(id, title, body, payload);
//         onDidReceiveLocalNotification.add(recievedNotification);
//       }
//     );
  
//      initializationSettings =  InitializationSettings(android:initializationSettingsAndroid,iOS:initializationSettingsIOS);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload)async{
      
//     });
//   }

//   _requestIOSPermission() {
//     flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
//       alert: false,
//       badge: false,
//       sound: true
//     );

//   }

//   setListenerForLowerVersions(Function onNotificationLowerVersion){
//     onDidReceiveLocalNotification.listen((recievedNotification) { 
//       onNotificationLowerVersion(recievedNotification);
//     });


//   }


//   setOnNotificationClick(Function onNotificationClick) async{
//   await  flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) async{
//       onNotificationClick(payload);
//     },);
//   }

//   Future<void> showNotification({int id = 0, String? title, String? body, String? payload}) async{
//     var androidNotificationChannel = AndroidNotificationDetails('channelId', 'channelName', 'channelDescription',importance: Importance.max);

//     var iOSdNotificationChannel = IOSNotificationDetails();

//     var platformChannelSpecifics = NotificationDetails(android: androidNotificationChannel,iOS: iOSdNotificationChannel);

//     await flutterLocalNotificationsPlugin.show(id, title, body, platformChannelSpecifics,payload: payload);
//   }

// }


// NotificationPlugin notificationPlugin = NotificationPlugin._();

// class ReviceNotification{
//   final int id;
//   final String? title;
//   final String? body;
//   final String? payload;

//   ReviceNotification(this.id, this.title, this.body, this.payload);
  
// }