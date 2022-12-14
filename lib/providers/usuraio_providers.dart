import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:portal_corp_v2/constants.dart';
import 'package:portal_corp_v2/models/Usuario.dart';
import 'package:http/http.dart' as http;

 const urlapi = url;

class Usuario_provider with ChangeNotifier {
  List<Usuario> usuario = [];

  getUsuario() async{
    //const url1 = 'http://10.0.2.2:8000/api/hola';
    //const url1 = 'http://192.168.18.122:8000/api/perfil';

    //const url = "https://jsonplaceholder.typicode.com/posts";
    
    final resp = await http.get(Uri.parse("$url/api/hola"),
    headers: {
      "Access-Control-Allow-Origin":"*",
      "Access-Control-Allow-Credentials":"true",
      'Content-type':'application/json',
      'Accept':'application/json'
    });

    final response = usuarioFromJson(resp.body);
    usuario = response;
    notifyListeners();
  }
}