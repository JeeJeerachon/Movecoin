import 'package:flutter/material.dart';
import 'package:movecoin/screen/home.dart';
import 'package:movecoin/utility/mystyle.dart';
import 'package:movecoin/screen/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movecoin/utility/nm_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final formKey = GlobalKey<FormState>();
  String usename, password;
  // void initState() {
  //   super.initState();
  //   checkStatus();
  // }

  // Future<void> checkStatus() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   FirebaseAuth firebaseUser = await firebaseAuth.currentUser();
  //   if (firebaseUser != null) {
  //     MaterialPageRoute materialPageRoute = MaterialPageRoute(
  //       builder: (BuildContext context) => Home(),
  //     );
  //     Navigator.of(context).pushAndRemoveUntil(
  //         materialPageRoute, (Route<dynamic> route) => false);
  //   }
  // }
  Future<void> checkAuthan() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .signInWithEmailAndPassword(email: usename, password: password)
        .then((response) {
      print('Success');
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Mystyle().showlogo(),
              Mystyle().showtitle('Movecoin'),
              Mystyle().mySizebox(),
              showForm(),
              Mystyle().mySizebox(),
              loginB(),
              Text('or'),
              signupB(),
            ],
          ),
        ),
      ),
    );
  }

  Widget signupB() => Container(
        width: 150.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => Signup(),
            );
            Navigator.of(context).push(materialPageRoute);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
      );

  Widget loginB() => Container(
        width: 150.0,
        child: RaisedButton(
          onPressed: () {
            formKey.currentState.save();
            print('email = $usename, password = $password');
            if (usename == null ||
                usename.isEmpty ||
                password == null ||
                password.isEmpty) {
              normalDialog(context, 'มีช่องว่าง');
            }
            checkAuthan();
          },
          child: Text(
            'Login',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
      );

  Widget userForm() => Container(
        width: 250.0,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
          ),
          onSaved: (String value) {
            usename = value.trim();
          },
        ),
      );

  Widget passForm() => Container(
        width: 250.0,
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(labelText: 'Password'),
          onSaved: (String value) {
            password = value.trim();
          },
        ),
      );

  Widget showForm() {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            userForm(),
            SizedBox(
              height: 10.0,
            ),
            passForm()
          ],
        ),
      ),
    );
  }
}
