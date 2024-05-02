import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  List students = [];
  TextEditingController friendlistcontroller = TextEditingController();
  addvalue() {
    setState(() {
      students.add(friendlistcontroller.text);
      friendlistcontroller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: friendlistcontroller,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                addvalue();
              },
              child: Text("Add Value"),
            )
          ],
        ),
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
