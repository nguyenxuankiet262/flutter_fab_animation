import 'package:flutter/material.dart';

Widget fabIcon(String text, IconData icon, Function function){
  return GestureDetector(
    onTap: function,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 8
          ),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    )
  );
}