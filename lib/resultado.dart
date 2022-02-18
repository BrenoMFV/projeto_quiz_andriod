import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int resultadoFinal;
  final void Function() recomecar;

  Resultado(this.resultadoFinal, this.recomecar);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pontuação Final',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Text(
            '${resultadoFinal}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            child: Text(
              'Voltar',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: recomecar,
          ),
        ],
      ),
    );
  }
}
