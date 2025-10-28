import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(
    DevicePreview(
      //enabled: !kReleaseMode
      builder: (context) =>
    MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      home: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            CustomCard(text: 'OOP'),
            CustomCard(text: 'DART', colors: [Colors.black, Colors.amberAccent]),
            CustomCard(text: 'FlUTTER', colors: [Colors.deepPurple, Colors.red]),
            
          ],

        ),
        ),
      ),
    )
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final List<Color> colors;
  const CustomCard({
    super.key,
    required this.text,
    this.colors = const [Colors.blue, Colors.green],
    

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors:colors,
           begin: Alignment.centerLeft,
            end: Alignment.centerRight
          )
      ),
      child: Center(
        child: Text(text,
        style: TextStyle(
          inherit: false,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        ),
      ),
    );
  }
}