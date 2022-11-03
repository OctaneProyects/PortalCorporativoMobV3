import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class Input extends StatelessWidget {
  final String nametext;
  final Color borderColor;
  final bool enabled;
  final int maxLength;
  final TextInputType keyboardType;
  // final String placeholder;
  // final Widget suffixIcon;
  final Widget prefixIcon;
  // final VoidCallback onTap;
  // final void Function(String) onChanged;
  final TextEditingController controller;
  // final bool autofocus;
  // final Color borderColor;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? textInputFormatter;
  final int maxline;

  const Input(
      {Key? key, 
      required this.nametext,
      this.borderColor = NowUIColors.black,
      this.enabled = true,
      this.prefixIcon = const Icon(Icons.keyboard_alt_rounded),
      required this.controller,
      this.maxLength = 200,
      this.keyboardType = TextInputType.text,
      this.onEditingComplete,
      this.textInputFormatter,
      this.maxline = 1}) : super(key: key);

  void nada() {}

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: NowUIColors.black,
        maxLength: maxLength,
        maxLines: maxline,
        // onTap: onTap,
        // onChanged: onChanged,
        controller: controller,
        // autofocus: autofocus,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        enabled: enabled,
        inputFormatters: textInputFormatter,
        style: const TextStyle(
            //height: 0.55,
            fontSize: 15.0,
            color: NowUIColors.black),
        textAlignVertical: const TextAlignVertical(y: 0.6),
        decoration: InputDecoration(
          filled: true,
          label: Card(
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0))),
            child: Text("  $nametext  ",style: const TextStyle(
              color: NowUIColors.black,
            //fontWeight: FontWeight.bold,
            fontSize: 18,
            ),),
          ),
          //labelText: nametext,
          // labelStyle: const TextStyle(
          //   color: NowUIColors.black,
          //   fontWeight: FontWeight.bold,
          //   fontSize: 30,
          //   backgroundColor: Colors.white,
          // ),
          fillColor: NowUIColors.white,
          hintStyle: const TextStyle(
            color: NowUIColors.black,
          ),
          // suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: NowUIColors.socialTwitter,
                  width: 1.0,
                  style: BorderStyle.solid)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: NowUIColors.success,
                  width: 1.0,
                  style: BorderStyle.solid)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                  color: NowUIColors.defaultColor,
                  width: 1.0,
                  style: BorderStyle.solid)),

          // hintText: placeholder
        ));
  }
}
