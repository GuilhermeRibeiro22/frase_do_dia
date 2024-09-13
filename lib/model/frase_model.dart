import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:frase_do_dia/controller/principal_controller.dart';

class FrasesModel {
  String? frase;
  String? autor;

  FrasesModel({this.frase, this.autor});

  FrasesModel.fromJson(Map<String, dynamic> json) {
    frase = json['frase'];
    autor = json['autor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frase'] = this.frase;
    data['autor'] = this.autor;
    return data;
  }

  static Future<FrasesModel> gerarFrase() async {
  final response = await http
      .get(Uri.parse('https://estevaorada.com/aulas/api/frases/'));

  if (response.statusCode == 200) {
    return FrasesModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Falha ao obter Frase.');
  }
}
}
