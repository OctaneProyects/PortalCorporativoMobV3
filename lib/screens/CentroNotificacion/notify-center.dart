import 'package:flutter/material.dart';
import 'package:portal_corp_v2/screens/perfil/perfil.dart';
import 'package:portal_corp_v2/services/push.notify.dart';
import 'package:portal_corp_v2/widgets/card-notify.dart';
import 'package:provider/provider.dart';
import '../../../providers/usuraio_providers.dart';
import 'package:portal_corp_v2/constants.dart';

import '../../services/local_notifu2.dart';
import 'components/detalle-notidy.dart';

class NotifyCenter extends StatefulWidget {
  const NotifyCenter({Key? key, required this.noemp}) : super(key: key);

  final int noemp;

  @override
  State<NotifyCenter> createState() => _NotifyCenterState();
}

class _NotifyCenterState extends State<NotifyCenter> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatorKeyGlobal = navigatorKey;
    contextGlobal = context;
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poveedores',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat'),
      navigatorKey: navigatorKey,
      home: MyNotifyCenter(user: widget.noemp),
    );
  }
}

class MyNotifyCenter extends StatefulWidget {
  const MyNotifyCenter({Key? key, required this.user}) : super(key: key);

  final int user;

  @override
  State<MyNotifyCenter> createState() => _MyNotifyCenterState();
}

class _MyNotifyCenterState extends State<MyNotifyCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                // setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyProfile(user: widget.user)));
                // });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                ],
              )),
          title: const Text(
            'Centro de notificaciones',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: NowUIColors.navbarColor,
          foregroundColor: NowUIColors.white,
        ),
        body: ListView(
          children: [
            Column(
              children: const [
                CardNotify(id: 'id1',),
                CardNotify(
                  aprobacion: false,
                  id: 'id2',
                ),
                CardNotify(id: 'id3',),
                CardNotify(
                  aprobacion: false,
                  id: 'id4',
                ),
              ],
            )
          ],
        ));
  }

  // onNotificationClick(ReviceNotification recievedNotification) {}

  // onNotificationLowerVersion(String? payload) {
  //   print('payload: $payload');
  // }
}
