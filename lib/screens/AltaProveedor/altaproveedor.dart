import 'package:flutter/material.dart';
import 'package:portal_corp_v2/widgets/card-category.dart';
import 'package:portal_corp_v2/widgets/text-notify.dart';
import 'package:portal_corp_v2/constants.dart';

import '../../widgets/form-notify.dart';
import '../perfil/perfil.dart';

class AltaProveedores extends StatelessWidget {
  const AltaProveedores({super.key, required this.noproveedor});

  final int noproveedor;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: const MyAltaP(),
    );
  }
}

class MyAltaP extends StatefulWidget {
  const MyAltaP({super.key, this.notify = true});

  final bool notify;
  @override
  State<MyAltaP> createState() => _MyAltaPState();
}

class _MyAltaPState extends State<MyAltaP> {
  late bool notify;
  //var tiposcampos = ["Departamento","Solicitud de aprobacion","Descripcion","No. Proveedor","Proveedor","RFC"];
  @override
  void initState() {
    super.initState();
    notify = widget.notify;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: NowUIColors.navbarColor,
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                // setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Perfil(noemp: 952686)));

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
            'Notificación',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: NowUIColors.navbarColor,
          foregroundColor: NowUIColors.white,
        ),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        notify = !notify;
                      });
                    },
                    icon: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Cambio",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: NowUIColors.success,
                    )),
              ],
            ),
            const CardCategory(
              title: 'Detallado de notificación',
              img:
                  'https://www.todofondos.net/wp-content/uploads/1920x1080-Fondo-de-pantalla-de-color-solido-1024x576.jpg',
            ),
            Card(
              color: NowUIColors.navbarColor,
              elevation: 10,
              child: Container(
                //height: 1000,
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    if (notify)
                      const TextNotify(
                        texto:
                            'Se aprobó el siguiente proveedor PG293847 de la compania P1309.',
                      )
                    else
                      FormNotify()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}