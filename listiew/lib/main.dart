import 'package:flutter/material.dart';
import 'package:listiew/listview.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: listView(),
    );
  }
}
