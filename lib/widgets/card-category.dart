import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import '../constants.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    super.key,
    this.title = "Card Category",
    this.img =
        "https://civideportes.com.co/wp-content/uploads/2019/08/medidas-campo-de-futbol.jpg",
  });

  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: null,
        child: GestureDetector(
          child: Card(
              elevation: 0.4,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6.0)),
                        image: DecorationImage(
                          image: NetworkImage(img),
                          fit: BoxFit.cover,
                        ))),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.all(Radius.circular(6.0)))),
                Center(
                  child: Text(title,
                      style: const TextStyle(
                          color: NowUIColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          fontFamily: 'Montserrat')),
                )
              ])),
        ));
  }
}
