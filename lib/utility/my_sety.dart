import 'package:flutter/material.dart';

class MySety {
  Color darkColor = Colors.greenAccent.shade700;
  Color foneColor = Colors.red;
  Color dartColor = Colors.black;
  Color bolColor = Colors.blue;

  SizedBox mySizedBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  SizedBox sizedBox() => SizedBox(
        width: 10.0,
        height: 20.0,
      );

  Text showti(String ti) => Text(
        ti,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.greenAccent.shade700,
          fontWeight: FontWeight.bold,
        ),
      );

  Container showlogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Container showlog() {
    return Container(
      width: 120.0,
      child: Image.asset('images/told.png'),
    );
  }

  MySety();
}
