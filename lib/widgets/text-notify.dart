import '../constants.dart';
import 'package:flutter/material.dart';

class TextNotify extends StatelessWidget {
  const TextNotify(
      {super.key, this.texto = "",
    });


  final String texto;

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(texto, textAlign: TextAlign.justify,style: const TextStyle(fontSize: 20,fontFamily: 'Montserrat',color: NowUIColors.white)),
        Text(""),
        Text(""),
         Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              label: const Text(
                "Aceptar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: NowUIColors.success,
              )),
        ],
      ),
      ],
    );
  }
}