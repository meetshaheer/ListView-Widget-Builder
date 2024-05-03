import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  List students = ["Ahmed", "Ali", "Essa", "Waqas", "Saad"];

  TextEditingController friendlistcontroller = TextEditingController();
  TextEditingController updatevalcontroller = TextEditingController();

  addvalue() {
    setState(() {
      if (friendlistcontroller.text != "") {
        students.add(friendlistcontroller.text);
        friendlistcontroller.clear();
      }
    });
  }

  deletvalue({parameter}) {
    setState(() {
      students.removeAt(parameter);
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
              child: Text("Add"),
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
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          updatevalcontroller.text = students[index];
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Update Value"),
                                  content: TextField(
                                    controller: updatevalcontroller,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            students[index] =
                                                updatevalcontroller.text;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text("Update Value"))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          deletvalue(parameter: index);
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ],
                  )),
            );
          },
        )));
  }
}
