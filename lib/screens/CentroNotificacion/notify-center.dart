import 'package:flutter/material.dart';
import 'package:portal_corp_v2/screens/perfil/perfil.dart';
import 'package:portal_corp_v2/widgets/card-notify.dart';
import 'package:provider/provider.dart';
import '../../../providers/usuraio_providers.dart';
import 'package:portal_corp_v2/constants.dart';

class NotifyCenter extends StatelessWidget {
  const NotifyCenter({super.key, required this.noemp});

  final int noemp;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poveedores',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat'),
      home: MyNotifyCenter(user: noemp),
    );
  }
}

class MyNotifyCenter extends StatefulWidget {
  const MyNotifyCenter({super.key, required this.user});

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
                CardNotify(),
                CardNotify(
                  aprobacion: false,
                ),
                CardNotify(),
                CardNotify(
                  aprobacion: false,
                ),
              ],
            )
          ],
        ));
  }
}
