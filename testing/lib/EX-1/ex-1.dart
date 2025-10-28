import 'package:flutter/material.dart';


void main()
{
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello Mengheng',
          style: TextStyle(
            fontSize: 50,
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
    )
  );
}

