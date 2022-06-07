import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se373_project/Pages/createAccount.dart';
import 'package:se373_project/Pages/home.dart';
import 'package:se373_project/Pages/password.dart';
import 'package:se373_project/Pages/signIn.dart';

class loggedScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  User? currentUser = FirebaseAuth.instance.currentUser;
  Future<String?> getCurrentUserEmail() async {

    final String? email = currentUser?.email.toString();
    print(email);
    return email;
  }
  var collection = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 120.0),
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder(
                future: getCurrentUserEmail(),
                builder: (context, AsyncSnapshot snapshot) {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      snapshot.data,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 120.0),
                    child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: FlatButton(
                            child: Text(
                              'Logout',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          createAccountPage('4')));
                            },
                          ),
                        ))),
              ),
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 120.0),
                    child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          child: FlatButton(
                            child: Text(
                              'Delete Account',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            onPressed: () async {

                              FirebaseAuth.instance.currentUser?.delete();
                              await FirebaseAuth.instance.signOut();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      createAccountPage('4')));
                            },
                          ),
                        ))),
              ),
              Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 120.0),
                  child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.purple[800],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                          child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => passwordPage()),
                          );

                        },
                        child: Text(
                          "Change Password",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
