import 'package:flutter/material.dart';
import 'package:movecoin/utility/mystyle.dart';

class Additem extends StatefulWidget {
  @override
  _AdditemState createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  //field

  //method
  Widget nameForm() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        decoration: InputDecoration(labelText: 'ชื่อสินค่า'),
      ),
    );
  }

  Widget price() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        decoration: InputDecoration(labelText: 'ราคารวม'),
      ),
    );
  }

  Widget deductMoney() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        decoration: InputDecoration(labelText: 'ค่าเงินรายวันครั้งละ'),
      ),
    );
  }

  Widget showbuttonin() {
    return Container(
      child: Row(children: <Widget>[SizedBox(width: 25,),calculateButton(),SizedBox(width: 5,),canCel()
      ],

      ),
    );
  }

  Widget calculateButton() {
    return Container(
      width: 150.0,
      child: RaisedButton(
        onPressed: () {},
        child: Text('ตกลง'),
      ),
    );
  }

  Widget canCel() {
    return Container(
      width: 150.0,
      child: RaisedButton(
        onPressed: () {},
        child: Text('ยกเลิก'),
      ),
    );
  }

  Widget showMet() {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            nameForm(),
            price(),
            deductMoney(),SizedBox(height: 10,),
            showbuttonin()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: <Widget>[showMet()],
        ),
      ),
    );
  }
}
