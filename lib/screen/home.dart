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
              child: Mystyle().showButtonHomelist(),
            )
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
