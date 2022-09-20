import 'dart:convert';

import 'package:flutter/cupertino.dart';



List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
    Usuario({
        required this.prettyname,
        required this.tbElement,
        required this.puDescrip,
        this.email,
        this.extension,
        this.marcaRapida,
        this.celPersonal,
        this.telTrabajo,
        this.telPersonal,
        required this.imBlob,
    });

    String prettyname;
    String tbElement;
    String puDescrip;
    String? email;
    int? extension;
    int? marcaRapida;
    String? celPersonal;
    String? telTrabajo;
    String? telPersonal;
    List<int> imBlob;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        prettyname: json["PRETTYNAME"],
        tbElement: json["TB_ELEMENT"],
        puDescrip: json["PU_DESCRIP"],
        email: json["Email"],
        extension: json["Extension"],
        marcaRapida: json["MarcaRapida"],
        celPersonal: json["CelPersonal"],
        telTrabajo: json["TelTrabajo"],
        telPersonal: json["TelPersonal"],
        imBlob: List<int>.from(json["IM_BLOB"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "PRETTYNAME": prettyname,
        "TB_ELEMENT": tbElement,
        "PU_DESCRIP": puDescrip,
        "Email": email,
        "Extension": extension,
        "MarcaRapida": marcaRapida,
        "CelPersonal": celPersonal,
        "TelTrabajo": telTrabajo,
        "TelPersonal": telPersonal,
        "IM_BLOB": List<dynamic>.from(imBlob.map((x) => x)),
    };
}

