import '../constants.dart';
import 'package:flutter/material.dart';

class TextH1 extends StatelessWidget {
  const TextH1(
      {super.key, this.texto = "",
    });


  final String texto;

  
  @override
  Widget build(BuildContext context) {
    return  Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
              child:  Text(texto,style: const TextStyle(color: NowUIColors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          ],
        );
  }
}