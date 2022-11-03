import 'package:flutter/material.dart';
import 'package:portal_corp_v2/constants.dart';
import 'package:portal_corp_v2/screens/CentroNotificacion/components/detalle-notidy.dart';

class CardNotify extends StatelessWidget {
  const CardNotify({Key? key, this.aprobacion = true, required this.id})
      : super(key: key);

  final bool aprobacion;
  final String id;

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
      color: Colors.transparent,
      child: Dismissible(
        key: ValueKey(id),
        background: Card(
          color: NowUIColors.error,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: NowUIColors.white)),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: [
                (aprobacion)
                    ? const Icon(
                        Icons.cancel,
                        size: 30,
                        color: NowUIColors.white,
                      )
                    : const Icon(
                        Icons.delete,
                        size: 30,
                        color: NowUIColors.white,
                      ),
                const Text('  '),
                (aprobacion)
                    ? const Text(
                        'Rechazar',
                        style: TextStyle(
                            fontSize: 30,
                            color: NowUIColors.white,
                            fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        'Eliminar',
                        style: TextStyle(
                            fontSize: 30,
                            color: NowUIColors.white,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
        ),
        secondaryBackground: Card(
          color: (aprobacion) ? NowUIColors.success : NowUIColors.error,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: NowUIColors.white)),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                (aprobacion)
                    ? const Text(
                        'Aprobar',
                        style: TextStyle(
                            fontSize: 30,
                            color: NowUIColors.white,
                            fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        'Eliminar',
                        style: TextStyle(
                            fontSize: 30,
                            color: NowUIColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                const Text('  '),
                (aprobacion)
                    ? const Icon(
                        Icons.check_circle,
                        size: 30,
                        color: NowUIColors.white,
                      )
                    : const Icon(
                        Icons.delete,
                        size: 30,
                        color: NowUIColors.white,
                      ),
              ],
            ),
          ),
        ),
        child: Card(
          //color: Colors.transparent,
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
                                width: MediaQuery.of(context).size.width *
                                    ancho *
                                    .2,
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
                                                color:
                                                    NowUIColors.navbarColor)),
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
                                                color:
                                                    NowUIColors.navbarColor)),
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
                                width: MediaQuery.of(context).size.width *
                                    ancho *
                                    .8,
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
                          width:
                              MediaQuery.of(context).size.width * ancho * .33,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // if (aprobacion)
                              //   OutlinedButton.icon(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.check_circle,
                              //         color: Colors.white,
                              //       ),
                              //       label: const Text(
                              //         "Aprobar",
                              //         style: TextStyle(
                              //             color: Colors.white, fontSize: 12),
                              //       ),
                              //       style: OutlinedButton.styleFrom(
                              //         shape: const StadiumBorder(),
                              //         backgroundColor: NowUIColors.success,
                              //       )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width * ancho * .33,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // if (aprobacion)
                              //   OutlinedButton.icon(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.cancel_rounded,
                              //         color: Colors.white,
                              //       ),
                              //       label: const Text(
                              //         "Rechazar",
                              //         style: TextStyle(
                              //             color: Colors.white, fontSize: 12),
                              //       ),
                              //       style: OutlinedButton.styleFrom(
                              //         shape: const StadiumBorder(),
                              //         backgroundColor: NowUIColors.error,
                              //       )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width * ancho * .33,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton.icon(
                                  onPressed: () {
                                    if (aprobacion) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyNotify(
                                                    notify: false,
                                                  )));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyNotify()));
                                    }
                                  },
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
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            //Aprobar
            if(aprobacion){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Row(
                        children: const <Widget>[
                          Text(
                            "Solicitud Aceptada   ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: NowUIColors.success,
                            size: 25,
                          )
                        ],
                      ));
                    });             
            }
            //Eliminar
            else{
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.delete_sharp,
                            color: NowUIColors.error,
                            size: 25,
                          ),
                          Text(
                            "Notificación Eliminada   ",
                            style: TextStyle(fontSize: 20),
                          ),
                          
                        ],
                      ));
                    });        
            }
          } else {
            //Rechazar
            if(aprobacion){
                 showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.delete_sharp,
                            color: NowUIColors.error,
                            size: 25,
                          ),
                          Text(
                            "Solicitud Rechazada   ",
                            style: TextStyle(fontSize: 20),
                          ),
                          
                        ],
                      ));
                    });           
            }
            //Eliminar
            else{
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          content: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.delete_sharp,
                            color: NowUIColors.error,
                            size: 25,
                          ),
                          Text(
                            "Notificación Eliminada   ",
                            style: TextStyle(fontSize: 20),
                          ),
                          
                        ],
                      ));
                    });
            }
          }
        },
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
              fontFamily: 'Montserrat'
              //color: NowUIColors.white
              ),
          textAlign: TextAlign.left,
        ),
      ],
    ),
    if (contiene)
      Text(
        (contenido),
        style: const TextStyle(fontSize: 16, fontFamily: 'Montserrat'

            //color: NowUIColors.white
            ),
        textAlign: TextAlign.left,
      )
  ]);
}
