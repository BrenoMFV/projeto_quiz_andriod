import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Quanto tempo levou para fazer isso?',
      'respostas': [
        {'texto': '10 min', 'pontuacao': 0},
        {'texto': '1 hora', 'pontuacao': 5},
        {'texto': '2 dias', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Quantas pessoas moram na minha casa?',
      'respostas': [
        {'texto': '1 pessoas', 'pontuacao': 0},
        {'texto': '3 pessoas', 'pontuacao': 10},
        {'texto': '9 pessoas', 'pontuacao': 5},
      ]
    },
    {
      'texto': 'Qual é essa linguagem de programação?',
      'respostas': [
        {'texto': 'Dart', 'pontuacao': 10},
        {'texto': 'C#', 'pontuacao': 5},
        {'texto': 'Javascript', 'pontuacao': 0},
      ]
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _recomecar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print('Pontuação: ${_pontuacaoTotal}');
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas App'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _recomecar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
