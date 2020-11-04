import 'package:flutter/material.dart';

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

  

  // Widget showButtonHomelist() {
  //   //ตัวbuttonในหน้ารายการ
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       SizedBox(
  //         width: 5.0,
  //       ),

  //       buttonList(),
  //       SizedBox(
  //         width: 5.0,
  //       ),
  //       buttonInputlist()
  //     ],
  //   );
  // }

  // Widget buttonList() => Container(
  //       width: 130.0,
  //       height: 80.0,
  //       child: RaisedButton.icon(
  //         onPressed: () {
  //           MaterialPageRoute materialPageRoute = MaterialPageRoute(
  //             builder: (BuildContext context) => Listitem(),
  //           );
  //         },
  //         icon: Icon(Icons.list),
  //         label: Text('รายการ'),
  //       ),
  //     );

  // Widget buttonInputlist() => Container(
  //       width: 130.0,
  //       height: 80.0,
  //       child: FloatingActionButton(
  //         onPressed: () {
  //           showDialog(
  //             context: context,
  //             builder: (BuildContext context) {
  //               return AlertDialog(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(8)),
  //                 title: Text("Add Todolist"),
  //                 content: TextField(
  //                   onChanged: (String value) {
  //                     todoTitle = value;
  //                   },
  //                 ),
  //                 actions: <Widget>[
  //                   FlatButton(
  //                       onPressed: () {
  //                         createTodos();

  //                         Navigator.of(context).pop();
  //                       },
  //                       child: Text("Add"))
  //                 ],
  //               );
  //             });
  //         },
  //         icon: Icon(Icons.add),
  //         label: Text('เพิ่มรายการ'),
  //       ),
  //     );

  //     createTodos() {
  //   DocumentReference documentReference =
  //       Firestore.instance.collection("MyTodos").document(todoTitle);

  //   //Map
  //   Map<String, String> todos = {"todoTitle": todoTitle};

  //   documentReference.setData(todos).whenComplete(() {
  //     print("$todoTitle created");
  //   });
  // }
  // deleteTodos(item) {
  //   DocumentReference documentReference =
  //       Firestore.instance.collection("MyTodos").document(item);

  //   documentReference.delete().whenComplete(() {
  //     print("$item deleted");
  //   });
  // }
  Mystyle();
}
