import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:portal_corp_v2/constants.dart';
import 'package:portal_corp_v2/models/usuario.dart';
import 'package:http/http.dart' as http;

 const urlapi = url;

class UsuarioProvider with ChangeNotifier {
  List<Usuario> usuario = [];

  UsuarioProvider(int noemp){
    getUsuario(noemp);
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

  postActualizaInfo(int? user1,String? atributo, String? valor) async{
   
    final resp = await http.post(Uri.parse("$url/api/actualiza/"),body: {
      "Id":user1.toString(),
      "Atributo":atributo,
      "Valor":valor
    });
  }
  
  postActualizaImg(int user1,List<int> imagen) async{
    
    String imagen64 = base64.encode(imagen);

    final resp = await http.post(Uri.parse("$url/api/img/"),body:  {
      "Id":user1.toString(),
      "Img":imagen64
    }
    );
  }
 
  
}