import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'ui/expenses/expenses_screen.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) =>
    MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    ),
    )
  );
}
