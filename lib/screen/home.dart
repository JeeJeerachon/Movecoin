import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movecoin/screen/additem.dart';
import 'package:movecoin/utility/mystyle.dart';
import 'package:movecoin/screen/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String itemname;
  int price, priceday;

  Widget uploadButton() {
    return Column(
      children: [
        SizedBox(
          width: 10,
          height: 5,
        ),
        Container(
          width: 150,
          height: 50,
          child: RaisedButton(
            onPressed: () {
              showAlert('x', 'y');
            },
            child: Text('เพิ่มสิ่งของ'),
          ),
        ),
      ],
    );
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('ชื่อสิ่งของ'),
                  TextField(
                    onChanged: (String x) {
                      itemname = x;
                    },
                  ),
                  Text('ราคา'),
                  TextField(
                    onChanged: (String y) {
                      price = int.parse(y);
                    },
                  ),
                  Text('หักวันละ'),
                  TextField(
                    onChanged: (String z) {
                      priceday = int.parse(z);
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                insertValue();
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  Future<void> insertValue() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Map<String, dynamic> map = Map();
    map['itemname'] = itemname;
    map['price'] = price;
    map['priceday'] = priceday;
    print(itemname);
    print(price.toString());
    print(priceday.toString());
    await firebaseFirestore.collection('item').doc().set(map).then(
      (value) {
        print('itemname');
      },
    );
  }

  @override
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Movecoin",
          style: TextStyle(fontSize: 25, fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Mystyle().showlogo1(),
          SizedBox(
            width: 10,
            height: 10,
          ),
          uploadButton(),
        ],
      )),
    );
  }
}

Container logout() {
  return Container(
    width: 200,
    height: 50,
    child: RaisedButton.icon(
      icon: Icon(Icons.logout),
      label: Text('Logout'),
      onPressed: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
          builder: (BuildContext context) => Login(),
        );
      },
    ),
  );
}
