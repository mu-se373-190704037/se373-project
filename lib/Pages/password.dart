import 'package:flutter/material.dart';
import 'package:se373_project/Pages/createAccount.dart';
import 'package:se373_project/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
class passwordPage extends StatefulWidget {
  @override
  _passwordPageState createState() => _passwordPageState();
}

class _passwordPageState extends State<passwordPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: password(),
      ),
    );
  }
}

class password extends StatefulWidget {
  password({Key? key}) : super(key: key);


  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  late String _email;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          "Please enter your e-mail address to reset your password.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(17),
                      child: TextField(
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
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                        onChanged: (value){
                          setState(() {
                            _email=value;
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
                        child: FlatButton(
                          onPressed: () {
                            auth.sendPasswordResetEmail(email: _email);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Reset Password',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

