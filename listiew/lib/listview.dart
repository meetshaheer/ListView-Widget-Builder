import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  List students = ["Ali", "Ahmed", "Saad", "Asad", "Waqas", "Essa", "Sadaf"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 2),
          child: ListTile(
            tileColor: Colors.amber[100],
            title: Text(students[index]),
          ),
        );
      },
    )));
  }
}
