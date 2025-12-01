import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'expense.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) =>
    MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ronan the BEst"),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.add)
            ),
          ],
            backgroundColor: Colors.amber,
          ),
          
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListExpense(),
        ),
      ),
    ),
    )
  );
}


