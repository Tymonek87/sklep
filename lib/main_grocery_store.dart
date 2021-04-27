import 'package:flutter/material.dart';
import 'main.dart';

class MainGroceryStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GroceryStoreHome(),
    );
  }
}
