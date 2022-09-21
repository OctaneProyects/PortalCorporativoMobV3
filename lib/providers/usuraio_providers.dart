import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:portal_corp_v2/constants.dart';
import 'package:portal_corp_v2/models/usuario.dart';
import 'package:http/http.dart' as http;

 const urlapi = url;

class UsuarioProvider with ChangeNotifier {
  List<Usuario> usuario = [];

  UsuarioProvider(){
    getUsuario(user);
  }

  getUsuario(int user) async{
    //const url1 = 'http://10.0.2.2:8000/api/hola';
    //const url1 = 'http://192.168.18.122:8000/api/perfil';

    //const url = "https://jsonplaceholder.typicode.com/posts";
    
    final resp =  await http.get(Uri.parse("$url/api/perfil/$user"));
    final response = usuarioFromJson(resp.body);
    usuario = response;
    notifyListeners();
    
  }
  
 
  
}