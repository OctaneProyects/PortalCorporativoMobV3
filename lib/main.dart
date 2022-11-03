import 'package:flutter/material.dart';
import 'package:portal_corp_v2/screens/CentroNotificacion/notify-center.dart';
import 'package:portal_corp_v2/services/push.notify.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  
  runApp( const NotifyCenter(noemp: 952686));
  //runApp( const Perfil(noemp: 952686));
} 

