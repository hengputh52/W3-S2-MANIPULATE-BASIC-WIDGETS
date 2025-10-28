import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(
    DevicePreview(
      enabled: !kReleaseMode
      ,builder: (context) =>
    MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      home: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors:[
                    Colors.blue,
                    Colors.limeAccent,

                  ], begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                  )
              ),
              child: Center(
                child: Text('OPP',
                style: TextStyle(
                  inherit: false,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.greenAccent,
                  ], begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
              ),
              child: Center(
                child: Text('DART',
                style: TextStyle(
                  inherit: false,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.redAccent,
                  ], 
                )
              ),
              child: Center(
                child: Text('FLUTTER',
                style: TextStyle(
                  inherit: false,
                  fontSize: 20,
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                ),
                ),
              ),
            )
          ],

        ),
        ),
      ),
    )
  );
}