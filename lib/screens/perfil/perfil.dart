import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_corp_v2/constants.dart';
import 'package:portal_corp_v2/providers/usuraio_providers.dart';
import 'package:portal_corp_v2/screens/perfil/components/usuario.dart';
import 'package:provider/provider.dart';

import '../../widgets/input.dart';
import '../AltaProveedor/altaproveedor.dart';

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
            fontFamily: 'Montserrat',
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
  late TextEditingController txtMarcaR = TextEditingController();
  late TextEditingController txtExt = TextEditingController();
  late TextEditingController txtCel = TextEditingController();
  late TextEditingController txtTrabajo = TextEditingController();
  late TextEditingController txtCasa = TextEditingController();
  late TextEditingController txtEmail = TextEditingController();

  void getInicial() {
    marcarAnt = usuarioProvider!.usuario[0].marcaRapida.toString();
    extAnt = usuarioProvider!.usuario[0].extension.toString();
    celAnt = usuarioProvider!.usuario[0].celPersonal.toString();
    trabajoAnt = usuarioProvider!.usuario[0].telTrabajo.toString();
    casaAnt = usuarioProvider!.usuario[0].telPersonal.toString();
    emailAnt = usuarioProvider!.usuario[0].telTrabajo.toString();
    ponImagen = usuarioProvider!.usuario[0].imBlob;
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
        ponImagen = usuarioProvider!.usuario[0].imBlob;
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
  void initState() {
    //getInicial();
    firsttime = false;
    super.initState();
  }

  @override
  void dispose() {
   
    super.dispose();
     //getCancel();
  }

  void terminaescribir() {
    FocusScope.of(context).unfocus();
    //cambio = false;
    //getCancel();
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
            backgroundColor: NowUIColors.navbarColor,
            leading: GestureDetector(
                onTap: () {
                  // setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AltaProveedores(noproveedor: 952686)));

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
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
                        ]))
              ],
            )),
        //Contenido de la aplicacion
        body: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_constructors
          children: <Widget>[
            MyUser(
                nombre: usuarioProvider!.usuario[0].prettyname,
                depto: usuarioProvider!.usuario[0].puDescrip,
                puesto: usuarioProvider!.usuario[0].tbElement,
                // imagen: ponImagen!,
                noemp: widget.user),
            Column(children: <Widget>[
              Card(
                  color: NowUIColors.navbarColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  elevation: 20,
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.all(0),
                      child: Column(children: <Widget>[
                        Input(
                          nametext: "EXT.",
                          prefixIcon: const Icon(
                            Icons.fax,
                            color: NowUIColors.black,
                          ),
                          controller: txtExt,
                          enabled: checked,
                          maxLength: 5,
                          keyboardType: TextInputType.number,
                          textInputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onEditingComplete: terminaescribir,
                        ),
                        Input(
                          nametext: "Marcación Rápida",
                          prefixIcon: const Icon(
                            Icons.call_made,
                            color: NowUIColors.black,
                          ),
                          controller: txtMarcaR,
                          enabled: checked,
                          maxLength: 5,
                          keyboardType: TextInputType.number,
                          textInputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onEditingComplete: terminaescribir,
                        ),
                        Input(
                          nametext: "Email",
                          prefixIcon: const Icon(
                            Icons.email,
                            color: NowUIColors.black,
                          ),
                          controller: txtEmail,
                          enabled: checked,
                          maxLength: 50,
                          keyboardType: TextInputType.emailAddress,
                          onEditingComplete: terminaescribir,
                        ),
                        Input(
                          nametext: "Celular de trabajo",
                          prefixIcon: const Icon(
                            Icons.call,
                            color: NowUIColors.black,
                          ),
                          controller: txtTrabajo,
                          enabled: checked,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          onEditingComplete: terminaescribir,
                          textInputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        Input(
                          nametext: "Celular de trabajo",
                          prefixIcon: const Icon(
                            Icons.call,
                            color: NowUIColors.black,
                          ),
                          controller: txtTrabajo,
                          enabled: checked,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          onEditingComplete: terminaescribir,
                          textInputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        Input(
                          nametext: "Celular personal",
                          prefixIcon: const Icon(
                            Icons.phone_android,
                            color: NowUIColors.black,
                          ),
                          controller: txtCel,
                          enabled: checked,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          onEditingComplete: terminaescribir,
                          textInputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        Input(
                          nametext: "Teléfono de casa",
                          prefixIcon: const Icon(
                            Icons.house,
                            color: NowUIColors.black,
                          ),
                          controller: txtCasa,
                          enabled: checked,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          onEditingComplete: terminaescribir,
                          textInputFormatter: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
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
                                    backgroundColor: NowUIColors.error,
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
                                        widget.user,
                                        "TelTrab",
                                        txtTrabajo.text);
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
                                              style: TextStyle(fontSize: 14),
                                            ),
                                            Icon(
                                              Icons.check,
                                              color: NowUIColors.success,
                                              size: 25,
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
                                  backgroundColor: NowUIColors.success),
                            )
                          ])))
            ])
          ],
        ),
      );
    } else {
      return const Scaffold(
        backgroundColor: NowUIColors.socialFacebook,
        body: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      );
    }
  }
}
