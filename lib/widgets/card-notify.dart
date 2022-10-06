import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:portal_corp_v2/constants.dart';

class CardAltaRapida extends StatelessWidget {
  const CardAltaRapida({super.key, this.aprobacion = true});

  final bool aprobacion;

  @override
  Widget build(BuildContext context) {
    double altura;
    double alturatexto;
    double alturabotones;
    double ancho = .93;


    if (aprobacion) {
      altura = 0.38;
      alturatexto = .8;
      alturabotones = .2;
    } else {
      altura = .28;
      alturatexto = .7;
      alturabotones = .3;
    }
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        //color: NowUIColors.navbarColor,
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: NowUIColors.navbarColor)),
        child: SizedBox(
            //color: NowUIColors.error,
            height: MediaQuery.of(context).size.height * altura,
            width: MediaQuery.of(context).size.width * ancho,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * ancho,
                    height: MediaQuery.of(context).size.height *
                        altura *
                        alturatexto,
                    //color: NowUIColors.active,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              //color: NowUIColors.black,
                              width:
                                  MediaQuery.of(context).size.width * ancho * .2,
                              height: MediaQuery.of(context).size.height *
                                  altura *
                                  alturatexto,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (aprobacion)
                                    Card(
                                      color: NowUIColors.socialTwitter,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          side: const BorderSide(
                                              color: NowUIColors.navbarColor)),
                                      child: const SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.fact_check_rounded,
                                          size: 45,
                                          //color: NowUIColors.white,
                                        ),
                                      ),
                                    )
                                  else
                                     Card(
                                      color: NowUIColors.socialTwitter,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(150),
                                          side: const BorderSide(
                                              color: NowUIColors.navbarColor)),
                                      child: const SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.notifications,
                                          size: 45,
                                          //color: NowUIColors.white,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              width:
                                  MediaQuery.of(context).size.width * ancho * .8,
                              height: MediaQuery.of(context).size.height *
                                  altura *
                                  alturatexto,
                              //color: NowUIColors.socialFacebook,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (aprobacion)
                                      Column(children: [
                                        textos("Aprobacion de Provedores", "",
                                            contiene: false),
                                        textos("Proveedor:",
                                            "ECO DIRECCION PROFESIONAL"),
                                        textos("Id Proveeedor:", "PG1012"),
                                        textos("RFC:", "EDP021217MSA"),
                                      ])
                                    else
                                      Column(
                                        children: [
                                          textos("Notificacion", "",
                                              contiene: false),
                                          textos("Formato de asistencia", "",
                                              contiene: false),
                                          textos("",
                                              "Se envio la asitencia, estacion La Glotia Semana 1 "),
                                        ],
                                      )
                                  ]),
                            ),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      altura *
                      alturabotones,
                  width: MediaQuery.of(context).size.width * ancho,
                  //color: NowUIColors.socialTwitter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ancho* .33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (aprobacion)
                              OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Aprobar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: NowUIColors.success,
                                  )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ancho * .33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (aprobacion)
                              OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cancel_rounded,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Rechazar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    backgroundColor: NowUIColors.error,
                                  )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * ancho * .33,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.description_rounded,
                                  color: Colors.white,
                                ),
                                label: const Text(
                                  "Detalles",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                style: OutlinedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor: NowUIColors.defaultColor,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Column textos(String titulo, String contenido, {bool contiene = true}) {
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
    if (contiene)
      Text(
        (contenido),
        style: const TextStyle(
          fontSize: 16,
          //color: NowUIColors.white
        ),
        textAlign: TextAlign.left,
      )
  ]);
}
