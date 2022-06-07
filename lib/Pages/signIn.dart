import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signIn extends StatefulWidget {
  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return uyeekrani();
  }
}

Future<void> userSetup(String displayName,String password) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  users.add({'email': displayName, 'uid': uid, 'password':password, 'comments':''});
  return;
}

class uyeekrani extends StatefulWidget {
  @override
  State<uyeekrani> createState() => _uyeekraniState();
}

class _uyeekraniState extends State<uyeekrani> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Center(
              child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: 'Email',
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
                padding: const EdgeInsets.all(8.0),
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
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password);
                        Navigator.of(context).pop();
                        userSetup(_email,_password);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }

                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ]),
          ))),
    );
  }
}
/*Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),

                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
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
                            hintText: 'Enter your student number',
                            prefixIcon: const Icon(
                              Icons.numbers,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),*/
