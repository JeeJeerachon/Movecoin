import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movecoin/utility/morpheus.dart';
import 'package:movecoin/utility/mystyle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String todoTitle = "";
   
  createTodos() {
    DocumentReference documentReference =
        Firestore.instance.collection("Myitem").document(todoTitle);

    //Map
    Map<String, String> todos = {"todoTitle": todoTitle};

    documentReference.setData(todos).whenComplete(() {
      print("$todoTitle created");
    });
  }

  deleteTodos(item) {
    DocumentReference documentReference =
        Firestore.instance.collection("MyTodos").document(item);

    documentReference.delete().whenComplete(() {
      print("$item deleted");
    });
  }

  final List<Widget> _screens = [
    Scaffold(
      // หน้ารายการ
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              child: Mystyle().showlogo1(),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text("Add Todolist"),
                  content: TextField(
                    onChanged: (String value) {
                      todoTitle = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          createTodos();

                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Scaffold(
      // ประวัติ
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            //หน้าจอ
          ],
        ),
      ),
    ),
    Scaffold(
        // บัญชี

        ),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movecoin'),
      ),
      body: MorpheusTabView(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('ประวัติ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('บัญชี'),
          ),
        ],
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
          }
        },
      ),
    );
  }
}
