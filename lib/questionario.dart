import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    this.perguntas,
    this.perguntaSelecionada,
    this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      // mapeia as respostas transformando elas em List<String>,
      // ao invés de Iterable<Map>
      ...respostas.map((resp) {
        return Resposta(
          resp['texto'],
          () => quandoResponder(int.parse(resp['pontuacao'].toString())),
        );
      }).toList(),
    ]);
  }
}
