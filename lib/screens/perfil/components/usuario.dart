import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants.dart';
import '../perfil.dart';

// ignore: must_be_immutable
class MyUser extends StatefulWidget {
   MyUser(
      {super.key,
      required this.nombre,
      required this.puesto,
      required this.depto,
      required this.imagen,
      required this.noemp});

  final String nombre, puesto, depto;
  List<int> imagen;
  final int noemp;

  @override
  State<MyUser> createState() => _MyUser();
}

class _MyUser extends State<MyUser> {
  final picker = ImagePicker();

  void getImage(context, noemp) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      selImage(1, context, noemp);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text(
                            "Tomar una foto",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selImage(2, context, noemp);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text(
                            "Seleccionar foto de la galeria",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.image_outlined,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Row(
                      children: const <Widget>[
                        Expanded(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }

  Future selImage(opc, context, noemp) async {
    XFile? pickedfile;
    pickedfile = null;

    if (opc == 1) {
      pickedfile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedfile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedfile != null) {
      setState(() {
        //Aqui debe ir el post de la imagen
        List<int> envioImg = File(pickedfile!.path).readAsBytesSync();
        usuario.postActualizaImg(noemp, envioImg);
        widget.imagen = envioImg;

        Navigator.of(context).pop();
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Row(
                children: const <Widget>[
                  Text(
                    "Cambio de imagen correcto ",
                    style: TextStyle(fontSize: 14),
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 25,
                  )
                ],
              ));
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: NowUIColors.navbarColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: const BorderSide(
      color: NowUIColors.navbarColor, //<-- SEE HERE
    ),),
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
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                   CircleAvatar(
                    backgroundImage:
                        MemoryImage(Uint8List.fromList(widget.imagen)),
                    //NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTUg81xUWPoaVpYNBQQqr5fQOkFUUI1uTkYA&usqp=CAU'),
                    radius: 70,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          getImage(context, widget.noemp);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 18,
                          child: Icon(
                            Icons.image_search,
                            color: Colors.blue.shade600,
                            semanticLabel: "Cambiar foto de perfil",
                          ),
                        ),
                      )),
                ],
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
                  child: textos("Nombre: ", widget.nombre)),
              Container(
                  width: MediaQuery.of(context).size.width * .5,
                  margin: const EdgeInsets.all(5),
                  child: textos("Puesto: ", widget.puesto)),
              Container(
                  width: MediaQuery.of(context).size.width * .5,
                  margin: const EdgeInsets.all(5),
                  child: textos("Departamento: ", widget.depto))
            ]),
          ),
        ],
      ),
    );
  }
}

Column textos(String titulo, String contenido) {
  return Column(children: <Widget>[
    
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          (titulo),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            //color: NowUIColors.white
          ),
          textAlign: TextAlign.left,
        ),
      ],
    ),
    Text(
      (contenido),
      style: const TextStyle(fontSize: 16,
      //color: NowUIColors.white
      ),
      textAlign: TextAlign.justify,
    )
  ]);
}
