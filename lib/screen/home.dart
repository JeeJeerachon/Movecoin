import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movecoin/screen/item.dart';
import 'package:movecoin/screen/item.dart';
import 'package:movecoin/screen/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String itemname;
  int price, priceday, day;
  List<ProductselectModel> productModels = List();

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Widget showAppname() {
    return Container(
      child: Text(
        'Movecoin',
        style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 80,
      height: 80,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showH() {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          showLogo(),
          SizedBox(
            height: 2,
          ),
          showAppname(),
          SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }

  Widget showdraw() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showH(),
        ],
      ),
    );
  }

  Widget showListView(int index) {
    return Row(
      children: <Widget>[
        showText(index),
      ],
    );
  }

  Widget showText(int index) {
    return Container(
      child: Card(
        // width: MediaQuery.of(context).size.width * 0.8,
        // height: MediaQuery.of(context).size.width * 0.3,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showName(index),
              showPrice(index),
              showPriceday(index),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showName(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(" สิ่งของชื่อ : ",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        Text(productModels[index].itemname,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.red,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget showPrice(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(" ราคารวม",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        Text(productModels[index].price.toString(),
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.green,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget showPriceday(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(" จ่ายวันละ",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        Text(productModels[index].priceday.toString(),
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.green,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  // Widget uploadButton() {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         width: 10,
  //         height: 5,
  //       ),
  //       Container(
  //         width: 150,
  //         height: 50,
  //         child: RaisedButton(
  //           onPressed: () {
  //             showAlert('x', 'y');
  //           },
  //           child: Text('เพิ่มสิ่งของ'),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ชื่อสิ่งของ',
                    ),
                    style: TextStyle(fontFamily: 'Montserrat'),
                    onChanged: (String x) {
                      itemname = x;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ราคารวม',
                    ),
                    style: TextStyle(fontFamily: 'Montserrat'),
                    onChanged: (String y) {
                      price = int.parse(y);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'จ่ายวันละ',
                    ),
                    style: TextStyle(fontFamily: 'Montserrat'),
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

  Future<void> readAllData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference collectionReference = firestore.collection("item");
    await collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.docs;

      for (var snapshot in snapshots) {
        ProductselectModel productModel =
            ProductselectModel.fromMap(snapshot.data());
        setState(() {
          productModels.add(productModel);
        });
      }
    });
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Movecoin",
          style: TextStyle(fontSize: 25, fontFamily: 'Montserrat'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (value) => Login());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlert('x', 'y');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: productModels.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return showListView(index);
            },
          ),
        ),
      ),
      drawer: showdraw(),
    );
  }
}
