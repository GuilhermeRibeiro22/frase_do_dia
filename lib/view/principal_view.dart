import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/espacamento_h.dart';
import 'components/copyright.dart';
import 'package:frase_do_dia/model/frase_model.dart';
import 'package:frase_do_dia/controller/principal_controller.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  PrincipalController controller = PrincipalController();

  void initState() {
    super.initState();
    _generateFrase(); // Chama o método para gerar a frase quando a tela é carregada
  }
 
  Future<void> _generateFrase() async {
    // Atualiza o estado da frase
    final frase = await controller.gerarFrase();
    setState(() {
      controller.resultado = frase;
    });
  }

  // IMPORTANTE!
  // As variáveis (autor e textoExemplo) abaixo deverão ser removidas e o controle dos valores dos
  // campos se dará por meio dos atributos do controlador!
  String autor = "Autor";
  String textoExemplo =
      'Clique no botão abaixo para gerar uma frase que irá aparecer aqui.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases Aleatórias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Image.network(
              'https://i.imgur.com/U4CLXbU.png',
              width: 200,
              height: 200,
            ),
            // Deverá substituir o campo abaixo com uma variável de controle:
            EspacamentoH(h: 20),

            EspacamentoH(h: 20),
            Text(
              controller.resultado
            ),
            EspacamentoH(h: 20),
            ElevatedButton(onPressed: () async{
              controller.resultado = await controller.gerarFrase();
              setState(() {
                
              });
                print(controller.resultado);
              
            }, child: Text("Gerar Frase")),
            EspacamentoH(h: 40),
            Copyright(),
          ],
        ),
      ),
    );
  }
}
