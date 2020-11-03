import 'package:flutter/material.dart';
import 'package:movecoin/screen/login.dart';
import 'package:movecoin/utility/mystyle.dart';
import 'package:movecoin/utility/nm_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movecoin/screen/home.dart';



class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();

  String username, password, repassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Mystyle().showlogo(),
                Mystyle().showtitle('Movecoin'),
                Mystyle().mySizebox(),
                userForm(),
                Mystyle().mySizebox(),
                passForm(),
                Mystyle().mySizebox(),
                repassForm(),
                Mystyle().mySizebox(),
                signupB(),
                Text('or'),
                loginB()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signupB() => Container(
        width: 150.0,
        child: RaisedButton(
          onPressed: () {
            if (username == null ||
                username.isEmpty ||
                password == null ||
                password.isEmpty ||
                repassword == null ||
                repassword.isEmpty) {
              normalDialog(context, 'มีช่องว่าง');
            }
            if (password != repassword) {
              normalDialog(context, 'รหัสไม่ตรงกัน');
            }
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              print(
                  'username == $username, password == $password, repassword == $repassword');
              registerThread();
            }
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
      );

  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: username, password: password)
        .then((response) {
      print('success signup = $username');
      // setupDisplayname();
    }).catchError((response) {
      String title = response.code;
      String message = response.message;
      print('title = $title, message = $message');
    });
  }

  // Future<void> setupDisplayname() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   await firebaseAuth.currentUser().then((response) {
  //     UserUpdateInfo userUpdateInfo = UserUpdateInfo();
  //     userUpdateInfo.displayName = nameString;
  //     response.updateProfile(userUpdateInfo);

  //     MaterialPageRoute materialPageRoute =
  //         MaterialPageRoute(builder: (BuildContext context) => Home());
  //     Navigator.of(context).pushAndRemoveUntil(
  //         materialPageRoute, (Route<dynamic> route) => false);
  //   });
  // }

  Widget loginB() => Container(
        width: 150.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Login(),
            );
            Navigator.of(context).push(materialPageRoute);
          },
          child: Text(
            'Login',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
      );
  Widget userForm() {
    var textField = TextField(
      onChanged: (value) => username = value.trim(),
      decoration: InputDecoration(
        labelText: 'Uesname',
      ),
    );
    return Container(
      width: 250.0,
      child: textField,
    );
  }

  Widget passForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          decoration: InputDecoration(labelText: 'Password'),
        ),
      );
  Widget repassForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => repassword = value.trim(),
          decoration: InputDecoration(labelText: 'Repassword'),
        ),
      );
}
