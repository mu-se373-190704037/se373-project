import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';


import 'dart:async';

class settingsPage extends StatefulWidget {
  final String title;
  const settingsPage(this.title) : assert(title != null);


  @override
  State<settingsPage> createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ayarlar(),
    );



  }
}
class ayarlar extends StatefulWidget {
  const ayarlar({Key? key}) : super(key: key);

  @override
  State<ayarlar> createState() => _ayarlarState();
}

class _ayarlarState extends State<ayarlar> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.purple[700],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Color(0xFF998CEB)),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              focusColor: Colors.yellow,
              onPressed: () {
              }, child: Container(
              decoration:
              BoxDecoration( borderRadius: BorderRadius.circular(20),color: Colors.purple[300],border: Border.all(color: Colors.black,width: 1)),
              height: 50,
              width: 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.account_circle,size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("Account Settings",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,),),
                  ),
                ],
              ),
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              focusColor: Colors.yellow,
              onPressed: () {

              }, child: Container(
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Colors.purple[300],border: Border.all(color: Colors.black,width: 1)),
              height: 50,
              width: 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.security,size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("Privacy Settings",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,),),
                  ),
                ],
              ),
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              focusColor: Colors.yellow,
              onPressed: () {

              }, child: Container(
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Colors.purple[300],border: Border.all(color: Colors.black,width: 1)),
              height: 50,
              width: 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.live_help,size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text("Help/Contact Settings",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,),),
                  ),
                ],
              ),
            ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              focusColor: Colors.yellow,
              onPressed: () {

              }, child: Container(
              decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),color: Colors.purple[300],border: Border.all(color: Colors.black,width: 1)),
              height: 50,
              width: 300,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.info_outline,size: 30,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 85),
                    child: Text("About",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20,),),
                  ),
                ],
              ),
            ),
            ),
          ),


        ],
      ),
    );
  }
}








