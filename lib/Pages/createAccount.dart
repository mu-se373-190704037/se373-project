import 'dart:ui';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se373_project/Pages/LoggedPage.dart';
import 'package:se373_project/Pages/password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se373_project/Pages/search.dart';
import 'signIn.dart';

class createAccountPage extends StatefulWidget {
  final String title;
  const createAccountPage(this.title) : assert(title != null);
  @override
  _createAccountPage createState() => _createAccountPage();
}



class _createAccountPage extends State<createAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hesapekrani()
      );
  }
}
void UpdateUser(dynamic element){
  User? currentUser= FirebaseAuth.instance.currentUser;
  if(currentUser!=null){
    FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: currentUser.email)
        .get()
        .then((querySnapshot) => {
      querySnapshot.docs.forEach((doc) => {
        doc.reference.update({'posts': FieldValue.arrayUnion([element])})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"))
      })
    });
  }


}


class hesapekrani extends StatefulWidget {
  hesapekrani({Key? key}) : super(key: key);

  @override
  State<hesapekrani> createState() => _hesapekraniState();
}

class _hesapekraniState extends State<hesapekrani> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    User? currentUser= FirebaseAuth.instance.currentUser; {
      if (currentUser != null) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (BuildContext context) => loggedScreen()));});

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                child: new TextField(
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 20, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: new TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide(width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white60),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.purple[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => loggedScreen()),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        } else if (e.code == 'user-disabled') {
                          print('User is Disabled');
                        }
                      }

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => passwordPage()),
                      );
                    },
                    child: Text(
                      'Forgot My Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple[800],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => signIn()),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
