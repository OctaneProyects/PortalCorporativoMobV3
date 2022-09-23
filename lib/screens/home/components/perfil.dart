import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_corp_v2/providers/usuraio_providers.dart';
import 'package:portal_corp_v2/screens/home/components/usuario.dart';
import 'package:provider/provider.dart';



bool checked = false;
bool firsttime = true;
bool cambio = false;
//File? imagenfile;

UsuarioProvider? usuarioProvider;
String marcarAnt = "";
String extAnt = "";
String celAnt = "";
String trabajoAnt = "";
String casaAnt = "";
String emailAnt = "";
List<int>? ponImagen;


class Perfil extends StatelessWidget {
  const Perfil({super.key, required this.noemp});

  final int noemp;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UsuarioProvider(noemp))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Perfil',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyProfile(title: 'Perfil', user: noemp),
        ));
  }
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key, required this.title, required this.user});
  final String title;
  final int user;

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late TextEditingController txtMarcaR;
  late TextEditingController txtExt;
  late TextEditingController txtCel;
  late TextEditingController txtTrabajo;
  late TextEditingController txtCasa;
  late TextEditingController txtEmail;

  void getInicial() {
    marcarAnt = usuarioProvider!.usuario[0].marcaRapida.toString();
    extAnt = usuarioProvider!.usuario[0].extension.toString();
    celAnt = usuarioProvider!.usuario[0].celPersonal.toString();
    trabajoAnt = usuarioProvider!.usuario[0].telTrabajo.toString();
    casaAnt = usuarioProvider!.usuario[0].telPersonal.toString();
    emailAnt = usuarioProvider!.usuario[0].telTrabajo.toString();
    ponImagen =  usuarioProvider?.usuario[0].imBlob;
    if (firsttime) {
      setState(() {
        txtMarcaR = TextEditingController(
          text: usuarioProvider!.usuario[0].marcaRapida.toString());
      txtExt = TextEditingController(
          text: usuarioProvider!.usuario[0].extension.toString());
      txtCel = TextEditingController(
          text: usuarioProvider!.usuario[0].celPersonal.toString());
      txtTrabajo = TextEditingController(
          text: usuarioProvider!.usuario[0].telTrabajo.toString());
      txtCasa = TextEditingController(
          text: usuarioProvider!.usuario[0].telPersonal.toString());
      txtEmail = TextEditingController(
          text: usuarioProvider!.usuario[0].email.toString());
      firsttime = false;
      });     
    }
  }

  void getCancel() {

    marcarAnt = usuarioProvider!.usuario[0].marcaRapida.toString();
    extAnt = usuarioProvider!.usuario[0].extension.toString();
    celAnt = usuarioProvider!.usuario[0].celPersonal.toString();
    trabajoAnt = usuarioProvider!.usuario[0].telTrabajo.toString();
    casaAnt = usuarioProvider!.usuario[0].telPersonal.toString();
    emailAnt = usuarioProvider!.usuario[0].telTrabajo.toString();
    //ponImagen =  usuarioProvider?.usuario[0].imBlob;
    setState(() {
    txtMarcaR.text = usuarioProvider!.usuario[0].marcaRapida.toString();
    txtExt.text = usuarioProvider!.usuario[0].extension.toString();
    txtCel.text = usuarioProvider!.usuario[0].celPersonal.toString();
    txtTrabajo.text = usuarioProvider!.usuario[0].telTrabajo.toString();
    txtCasa.text = usuarioProvider!.usuario[0].telPersonal.toString();
    txtEmail.text = usuarioProvider!.usuario[0].email.toString();
    });
  }

  

  @override
  Widget build(BuildContext context) {
    usuarioProvider = Provider.of<UsuarioProvider>(context);

    if (usuarioProvider!.usuario.isNotEmpty) {
      
      if (firsttime) {
        getInicial();
      }
      return Scaffold(
        //Barra superior
        appBar: AppBar(
            backgroundColor: Colors.blue.shade600,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
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
                    width: MediaQuery.of(context).size.width * .3,
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .3,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              checked = !checked;
                            });
                          },
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Visibility(
                                    visible: !checked,
                                    child: Row(
                                      children: const <Widget>[
                                        Icon(
                                          Icons.edit,
                                          size: 20,
                                        ),
                                        Text("Editar")
                                      ],
                                    ))
                              ])))
                ])),

        //Contenido de la aplicacion
        body: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_constructors
          children: <Widget>[
            MyUser(
               nombre: usuarioProvider!.usuario[0].prettyname,
               depto: usuarioProvider!.usuario[0].puDescrip,
               puesto: usuarioProvider!.usuario[0].tbElement,
               imagen: ponImagen!,
              noemp:widget.user),
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
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            cambio = false;
                          },
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
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            cambio = false;
                          },
                        ),
                        TextFormField(
                          enabled: checked,
                          maxLength: 50,
                          controller: txtEmail,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Email",
                              icon: Icon(Icons.email, color: Colors.black)),
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            cambio = false;
                          },
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
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            cambio = false;
                          },
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
                              icon: Icon(Icons.phone_android,
                                  color: Colors.black)),
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            cambio = false;
                          },
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
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                            cambio = false;
                          },
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
                                      cambio = true;
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
                                  //Aqui debe ir el post
                                  if (txtExt.text != extAnt) {
                                    usuarioProvider?.postActualizaInfo(
                                        widget.user, "Ext", txtExt.text);
                                  }
                                  if (txtCasa.text != casaAnt) {
                                    usuarioProvider?.postActualizaInfo(
                                        widget.user, "TelPers", txtCasa.text);
                                  }
                                  if (txtEmail.text != emailAnt) {
                                    usuarioProvider?.postActualizaInfo(
                                        widget.user, "Email", txtEmail.text);
                                  }
                                  if (txtCel.text != celAnt) {
                                    usuarioProvider?.postActualizaInfo(
                                        widget.user, "CelPers", txtCel.text);
                                  }

                                  if (txtMarcaR.text != marcarAnt) {
                                    usuarioProvider?.postActualizaInfo(
                                        widget.user, "MR", txtMarcaR.text);
                                  }

                                  if (txtTrabajo.text != trabajoAnt) {
                                    usuarioProvider?.postActualizaInfo(
                                        widget.user, "TelTrab", txtTrabajo.text);
                                  }
                                  usuarioProvider!.getUsuario(widget.user);

                                  cambio = true;
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            content: Row(
                                          children: const <Widget>[
                                            Text(
                                              "Datos Guardados Correctamente ",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 30,
                                            )
                                          ],
                                        ));
                                      });
                                });
                              },
                              icon: const Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              label: const Text(
                                "Guardar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
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
        body: const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      );
    }
  }
}
