import 'package:flutter/material.dart';
import 'package:frase_do_dia/model/frase_model.dart';



class PrincipalController{
  String resultado = "";


  Future<String> gerarFrase() async{
    
    FrasesModel racionais = FrasesModel();
    racionais = await FrasesModel.gerarFrase();
    return "${racionais.frase}\n - ${racionais.autor}";
  }
  
}