import 'package:flutter/material.dart';
import 'package:portal_corp_v2/widgets/card-notify.dart';
import 'package:provider/provider.dart';
import '../../../providers/usuraio_providers.dart';
import 'package:portal_corp_v2/constants.dart';

class Proveedores extends StatelessWidget {
  const Proveedores({super.key, required this.noemp});

  final int noemp;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsuarioProvider(noemp))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Poveedores',
          theme: ThemeData(
              primarySwatch: Colors.blueGrey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Montserrat'),
          home: MyVendors(title: 'Poveedores', user: noemp),
        ));
  }
}

class MyVendors extends StatefulWidget {
  const MyVendors({super.key, required this.title, required this.user});

  final String title;
  final int user;

  @override
  State<MyVendors> createState() => _MyVendorsState();
}

class _MyVendorsState extends State<MyVendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                // setState(() {

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
                // SizedBox(
                //     height: 20,
                //   ),
                // CardProveedores(),
                // SizedBox(
                //     height: 20,
                //   ),
                // CardProveedores(),
                // SizedBox(
                //     height: 20,
                //   ),
                CardAltaRapida(),
                CardAltaRapida(
                  aprobacion: false,
                ),
                CardAltaRapida(),
                CardAltaRapida(aprobacion: false,),


              ],
            )
          ],
        ));
  }
}

// class CardProveedores extends StatelessWidget {
//   const CardProveedores({super.key});

// final prov = 'Servicios SA.CV';
// final idProveedor = 'PG01234';
// final rfc = 'AAAE941110ku6';
//   @override
//   Widget build(BuildContext context) {
//     return

//       Card(
//         margin: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
//         //shadowColor: Colors.red,
//         elevation: 10,
//       child: Container(
//         height: 150,
//         color: Colors.white,
//         child: Row(
//           children:  [
//             const Center(
//               child:  Padding(
//                 padding: EdgeInsets.all(20),
//                 child: Expanded(
//                   child:
//                    Icon(
//                            Icons.add_reaction_rounded,
//                            color: Color.fromARGB(255, 2, 115, 146),
//                            size: 30.0
//                       ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child:Container(
//                 alignment: Alignment.center,
//                 child:  Column(
//                   children:  [
//                      Expanded(
//                           flex: 10,
//                           child:  Column(

//                             children:  const [
//                                Text('Notificacion de: Aprobacion'),
//                                Text('Modulo: Aprbacion de proveedores'),
//                                Text('Proveedor: ECO DIRECCION PROFESIONAL '),
//                                Text('IdProveedor: PG1001 '),
//                                Text('RFC: EDP021217MSA '),
//                             ],

//                           )
//                         //   ListTile(
//                         //     title: Text("Proveedor"),
//                         //     subtitle: Text("IdProveedor"),
//                         //     trailing:Text("RFC"),
//                         //   ),
//                          ),
//                          Expanded(
//                           flex: 5,
//                           child: Row(mainAxisAlignment: MainAxisAlignment.end,
//                           children: [TextButton(
//                             style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
//                             child: const Text('Rechazar', style:  TextStyle( color: NowUIColors.white)),
//                             onPressed: (){},
//                             ),
//                            const SizedBox(width: 8,),
//                             TextButton(
//                               style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
//                             child: const Text('Aprobar', style:  TextStyle( color: Colors.white)),
//                             onPressed: (){},
//                             ),
//                             const SizedBox(width: 8,),
//                             TextButton(
//                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),

//                                 child: const Text("Ver detalles", style:  TextStyle( color: Colors.white)),
//                                 onPressed: (){},
//                               ),
//                               const SizedBox(width: 8,)

//                           ],
//                           )
//                           )
//                   ],
//                 ),
//                 )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
