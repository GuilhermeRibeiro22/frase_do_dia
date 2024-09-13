import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "\u00a9 Faustão Aplicativos - Uma pitadinha de amor no seu dia a dia.",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 11),
    );
  }
}
