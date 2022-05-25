import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:se373_project/Pages/createAccount.dart';
import 'package:se373_project/Pages/home.dart';
import 'package:se373_project/Pages/signIn.dart';

class loggedScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 340.0),
                    child:Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(

                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:Container(
                          child:FlatButton(child: Text('Logout',
                            style: TextStyle(color: Colors.white,fontSize: 17),),onPressed: (){
                            auth.signOut();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => createAccountPage('4')));
                          },),
                        )

                    )

                ),
              ),
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 340.0),
                    child:Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(

                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:Container(
                          child:FlatButton(child: Text('Delete Account',
                            style: TextStyle(color: Colors.white,fontSize: 14),),
                            onPressed: () async{
                              FirebaseAuth.instance.currentUser?.delete();
                              await FirebaseAuth.instance.signOut();

                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>createAccountPage('4')));
                          },
                          ),
                        )

                    )

                ),
              ),
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.symmetric(vertical:340.0),
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
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>homePage('0')));
                              },
                              child: Text(
                                "Home Page",
                                style: TextStyle(color: Colors.white,fontSize: 17),),
                            )
                        )
                ),
              ),
              ),
            ],
          ),
        ],),

      );
  }
}