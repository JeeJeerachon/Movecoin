import 'package:flutter/material.dart';
import 'package:movecoin/screen/additem.dart';
import 'package:movecoin/screen/home.dart';
import 'package:movecoin/screen/Listitem.dart';

class Mystyle {
  SizedBox mySizebox() => SizedBox(
        width: 10.0,
        height: 20.0,
      );

  Text showtitle(String title) => Text(
        title,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 30.0),
      );

  Container showlogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Container showlogo1() {
    return Container(
      child: Image.asset('images/logo1.png'),
    );
  }

  Widget showButtonHomelist() {
    //ตัวbuttonในหน้ารายการ
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 5.0,
        ),
      
        buttonList(),
        SizedBox(
          width: 5.0,
        ),
        buttonInputlist()
      ],
    );
  }

  Widget buttonList() => Container(
        width: 130.0,
        height: 80.0,
        child: RaisedButton.icon(
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Listitem(),
            );
          },
          icon: Icon(Icons.list),
          label: Text('รายการ'),
        ),
      );

  Widget buttonInputlist() => Container(
        width: 130.0,
        height: 80.0,
        child: RaisedButton.icon(
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Additem(),
            );
          },
          icon: Icon(Icons.add),
          label: Text('เพิ่มรายการ'),
        ),
      );
  Mystyle();
}
