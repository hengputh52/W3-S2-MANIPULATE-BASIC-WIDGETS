import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[300],
      child: Column(
        children: [
          CustomCard(text: 'OPP', color: Colors.blueGrey),
          CustomCard(text: 'DART', color:  Colors.blue[100]!,),
          CustomCard(text: 'FLUTTER', color: Colors.red,),
          
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
          horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          
          ),
      child:Center(
          child: Text(
         text,
        style: TextStyle(
            color: Colors.white, decoration: TextDecoration.none),
      )),
    );
  }
}