import 'package:portal_corp_v2/widgets/H1.dart';
import 'package:portal_corp_v2/widgets/input.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class FormNotify extends StatefulWidget {
  FormNotify({super.key, this.texto = ""});

  final String texto;

  @override
  State<FormNotify> createState() => _FormNotifyState();
}

class _FormNotifyState extends State<FormNotify> {
  //var titulos;
  // var tiposcampos = ["Departamento","Solicitud de aprobacion","Descripcion","No. Proveedor","Proveedor","RFC"];
  int cont = 0;
  late TextEditingController txtdepartamento = TextEditingController();
  late TextEditingController txtSolicitud = TextEditingController();
  late TextEditingController txtDescrpcion = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtdepartamento.text = "Finanzas";
    txtSolicitud.text = "Aprobación de Proveedor";
    txtDescrpcion.text =
        "Se desea aprobar el proveedor PG33478, de la comañia P1304";
  }

  @override
  Widget build(BuildContext context) {
    cont = 0;
    return Column(children: [
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        // titulos.map<Widget>((e) {
        //   return Column(children: [
        //     Input(nametext: e,enabled: true),
        //     const Text(""),
        //   ]);
        // }).toList(),
        const TextH1(texto: "Departamento"),
        Input(
          nametext: "",
          prefixIcon: const Icon(
            Icons.contacts_rounded,
            color: NowUIColors.black,
          ),
          controller: txtdepartamento,
          enabled: false,
        ),
        const TextH1(texto: "Solicitud"),
        Input(
          nametext: "",
          prefixIcon: const Icon(
            Icons.fact_check_rounded,
            color: NowUIColors.black,
          ),
          controller: txtSolicitud,
          enabled: false,
        ),
        const TextH1(texto: "Descripción"),
        Input(
          nametext: "",
          prefixIcon: const Icon(
            Icons.description_rounded,
            color: NowUIColors.black,
          ),
          controller: txtDescrpcion,
          maxline: 10,
          enabled: false,
        ),
        //const Text(""),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Row(
                        children: const <Widget>[
                          Text(
                            "Solicitud Rechazada",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.cancel_outlined,
                            color: NowUIColors.error,
                            size: 25,
                          )
                        ],
                      ));
                    }).whenComplete(() => Navigator.pop(context));
                //Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              label: const Text(
                "Rezachar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: NowUIColors.error,
              )),
          OutlinedButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Row(
                        children: const <Widget>[
                          Text(
                            "Solicitud Aprobada",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: NowUIColors.success,
                            size: 25,
                          )
                        ],
                      ));
                    }).whenComplete(() => Navigator.pop(context));
                //Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              label: const Text(
                "Aprobar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: NowUIColors.success,
              )),
        ],
      ),
    ]);
  }
}
