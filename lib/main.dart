import 'package:portal_corp_v2/models/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_corp_v2/providers/usuraio_providers.dart';
import 'package:provider/provider.dart';
import 'package:portal_corp_v2/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Usuario_provider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const MyProfile(title: 'Perfil'),
        ));
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key, required this.title});
  final String title;


  @override
  State<MyProfile> createState() => _MyProfileState();
}

bool checked = false;
bool firsttime = true;
class _MyProfileState extends State<MyProfile> {
  Usuario_provider? usuarioProvider;
  late TextEditingController txtMarcaR;
  late TextEditingController txtExt;
  late TextEditingController txtCel;
  late TextEditingController txtTrabajo;
  late TextEditingController txtCasa;
  late TextEditingController txtEmail;


void getInicial (){ 
  if(firsttime){
    txtMarcaR =  TextEditingController(text: usuarioProvider!.usuario[0].marcaRapida.toString());
    txtExt = TextEditingController(text: usuarioProvider!.usuario[0].extension.toString());
    txtCel = TextEditingController(text: usuarioProvider!.usuario[0].celPersonal.toString());
    txtTrabajo = TextEditingController(text: usuarioProvider!.usuario[0].telTrabajo.toString());
    txtCasa = TextEditingController(text: usuarioProvider!.usuario[0].telPersonal.toString());
    txtEmail = TextEditingController(text: usuarioProvider!.usuario[0].email.toString());
    firsttime = false;
    }  
}

void getCancel (){ 

    txtMarcaR =  TextEditingController(text: usuarioProvider!.usuario[0].marcaRapida.toString());
    txtExt = TextEditingController(text: usuarioProvider!.usuario[0].extension.toString());
    txtCel = TextEditingController(text: usuarioProvider!.usuario[0].celPersonal.toString());
    txtTrabajo = TextEditingController(text: usuarioProvider!.usuario[0].telTrabajo.toString());
    txtCasa = TextEditingController(text: usuarioProvider!.usuario[0].telPersonal.toString());
    txtEmail = TextEditingController(text: usuarioProvider!.usuario[0].email.toString());
    firsttime = false;
}

  @override
  Widget build(BuildContext context) { 
    usuarioProvider =  Provider.of<Usuario_provider>(context);
      
    if(usuarioProvider!.usuario.isNotEmpty) {
      getInicial(); 
      return Scaffold(
      //Barra superior
      appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                width:  MediaQuery.of(context).size.width * .3,
                child: GestureDetector(
                    onTap: () {
                      // setState(() {
                        
                      // });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.arrow_back,
                          size: 35,
                        ),
                      ],
                    )),
                ),
                SizedBox(
                width:  MediaQuery.of(context).size.width * .3,
                child:Text(
                  widget.title,
                  textAlign: TextAlign.center,
                ),
                ),
                SizedBox(
                width:  MediaQuery.of(context).size.width * .3,
                child:  GestureDetector(
                    onTap: () {
                      setState(() {
                        checked = !checked;
                      });
                    },
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                    Visibility(
                        visible: !checked,
                        child: Row(
                          children: const <Widget>[
                            Icon(Icons.edit,size: 20,),
                            Text("Editar")
                          ],
                        ))]
                    ))          
                )              
              ])),

      //Contenido de la aplicacion
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_constructors
        children: <Widget>[
          miUsuario(context,usuarioProvider?.usuario[0].prettyname,usuarioProvider?.usuario[0].puDescrip,usuarioProvider?.usuario[0].tbElement,usuarioProvider?.usuario[0].imBlob),
          Column(children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                elevation: 20,
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(0),
                    child: Column(children: <Widget>[
                      // Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: <Widget>[
                      //       // Checkbox(
                      //       //   value: checked,
                      //       //   onChanged: (value) {
                      //       //     setState(() {
                      //       //       checked = value!;
                      //       //     });
                      //       //   },
                      //       // ),
                      //       GestureDetector(
                      //           onTap: () {
                      //             setState(() {
                      //               checked = !checked;
                      //             });
                      //           },
                      //           child: const Text("Editar")),
                      //     ]),
                      TextFormField(
                        enabled: checked,
                        maxLength: 5,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: txtExt,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "EXT.",                           
                            icon: Icon(Icons.fax, color: Colors.black)),
                      ),
                      TextFormField(
                        enabled: checked,
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: txtMarcaR,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Marcación Rápida",
                            icon: Icon(Icons.call_made, color: Colors.black)),
                      ),
                      TextFormField(
                        enabled: checked,
                         maxLength: 50,
                        controller: txtEmail,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Email",
                            icon: Icon(Icons.email, color: Colors.black)),
                      ),
                      TextFormField(
                        enabled: checked,
                         keyboardType: TextInputType.number,
                         maxLength: 10,
                         inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: txtTrabajo,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Celular de trabajo",
                            icon: Icon(Icons.call, color: Colors.black)),
                      ),
                      TextFormField(
                        enabled: checked,
                        keyboardType: TextInputType.number,
                          maxLength: 10,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: txtCel,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Celular personal",
                            icon:
                                Icon(Icons.phone_android, color: Colors.black)),
                      ),
                      TextFormField(
                        enabled: checked,
                         keyboardType: TextInputType.number,
                           maxLength: 10,
                         inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: txtCasa,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Teléfono de casa",
                            icon: Icon(Icons.house, color: Colors.black)),
                      ),
                    ]))),
            Padding(
                padding: const EdgeInsets.all(0),
                child: Visibility(
                    visible: checked,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                            child: OutlinedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    checked = !checked;
                                    getCancel();
                                  });
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Cancelar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: Colors.redAccent,
                                )),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                checked = !checked;
                                usuarioProvider?.getUsuario(user2);                               
                                showDialog(context: context, builder: (context) {
                                     return AlertDialog(
                                      content: Text(
                                        txtCasa.text
                                      ),
                                      );
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Guardar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: Colors.green),
                          )
                        ])))
          ])
        ],
      ),
    );
    } else {
      return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: const Center(child: 
        CircularProgressIndicator(
            color: Colors.white,
        )
      ),
    );
    }
  
  }
}

Card miUsuario(context,nombre,puesto,depto,imagen) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.all(10),
    elevation: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .3,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(0),
          child: Center(
            child: Container(
              child:  CircleAvatar(
                backgroundImage: MemoryImage(Uint8List.fromList(imagen)),
                //NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTUg81xUWPoaVpYNBQQqr5fQOkFUUI1uTkYA&usqp=CAU'),
                radius: 70,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * .5,
          padding: const EdgeInsets.all(0),
          child: Column(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * .5,
                margin: const EdgeInsets.all(5),
                child: textos("Nombre:", nombre)),
            Container(
                width: MediaQuery.of(context).size.width * .5,
                margin: const EdgeInsets.all(5),
                child: textos("Puesto:", puesto)),
            Container(
                width: MediaQuery.of(context).size.width * .5,
                margin: const EdgeInsets.all(5),
                child: textos("Departamento:", depto))
          ]),
        ),
      ],
    ),
  );
}

Column textos(String titulo, String contenido) {
  return Column(children: <Widget>[
    Container(
        child: Text(
      (titulo),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    )),
    Container(child: Text((contenido), style: const TextStyle(fontSize: 16),textAlign: TextAlign.justify,))
  ]);
}

// class MyData extends StatefulWidget {
//   const MyData({super.key});

//   @override
//   State<MyData> createState() => _MyDataState();
// }

// class _MyDataState extends State<MyData> {
//   //bool checked = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           margin: const EdgeInsets.all(10),
//           elevation: 20,
//           child: Container(
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(0),
//               child: Column(children: <Widget>[
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Checkbox(
//                         value: checked,
//                         onChanged: (value) {
//                           setState(() {
//                             checked = value!;
//                           });
//                         },
//                       ),
//                       GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               checked = !checked;
//                             });
//                           },
//                           child: const Text("Editar")),
//                     ]),
//                 TextFormField(
//                   enabled: checked,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: "EXT.",
//                       icon: Icon(Icons.fax, color: Colors.black)),
//                 ),
//                 TextFormField(
//                   enabled: checked,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: "Marcación Rápida",
//                       icon: Icon(Icons.call_made, color: Colors.black)),
//                 ),
//                 TextFormField(
//                   enabled: checked,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: "Email",
//                       icon: Icon(Icons.email, color: Colors.black)),
//                 ),
//                 TextFormField(
//                   enabled: checked,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: "Celular de trabajo",
//                       icon: Icon(Icons.call, color: Colors.black)),
//                 ),
//                 TextFormField(
//                   enabled: checked,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: "Celular personal",
//                       icon: Icon(Icons.phone_android, color: Colors.black)),
//                 ),
//                 TextFormField(
//                   enabled: checked,
//                   decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       labelText: "Teléfono de casa",
//                       icon: Icon(Icons.house, color: Colors.black)),
//                 ),
//               ]))),
//       Padding(
//           padding: const EdgeInsets.all(0),
//           child: Visibility(
//               visible: checked,
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
//                       child: OutlinedButton.icon(
//                           onPressed: () {
//                             setState(() {
//                               checked = !checked;
//                             });
//                           },
//                           icon: const Icon(
//                             Icons.cancel,
//                             color: Colors.white,
//                           ),
//                           label: const Text(
//                             "Cancelar",
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                           style: OutlinedButton.styleFrom(
//                             shape: const StadiumBorder(),
//                             backgroundColor: Colors.redAccent,
//                           )),
//                     ),
//                     OutlinedButton.icon(
//                       onPressed: () {
//                         setState(() {
//                           checked = !checked;
//                         });
//                       },
//                       icon: const Icon(
//                         Icons.save,
//                         color: Colors.white,
//                       ),
//                       label: const Text(
//                         "Guardar",
//                         style: TextStyle(color: Colors.white, fontSize: 20),
//                       ),
//                       style: OutlinedButton.styleFrom(
//                           shape: const StadiumBorder(),
//                           backgroundColor: Colors.green),
//                     )
//                   ])))
//     ]);
//   }
// }
