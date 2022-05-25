import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:se373_project/Pages/createDM.dart';


class DMPage extends StatefulWidget {
  final String title;
  const DMPage(this.title) : assert(title != null);

  @override
  State<DMPage> createState() => _DMPageState();
}

class _DMPageState extends State<DMPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text(("Direct Messages"),style: TextStyle(color: Colors.white,),),
          actions: <Widget>[
            IconButton(
                icon: Icon(

                  Icons.add_comment_outlined,
                  color: Colors.white,

                ),
              onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => createDMPage()),
                  );

              },
            )
          ],

        ),
        body: direktmesaj());
  }

}

class direktmesaj extends StatefulWidget {
  direktmesaj({Key? key}) : super(key: key);

  @override
  State<direktmesaj> createState() => _direktmesajState();
}

class _direktmesajState extends State<direktmesaj> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            width:screenSize.width ,
            height: screenSize.height *.825,

            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[



                Container(

                  width: screenSize.width,
                  height: screenSize.height * .07,
                  decoration: BoxDecoration(

                    color: Colors.black,
                    border: Border.all(

                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: RaisedButton(
                    color: Colors.black,
                      onPressed: () {},
                      child: Align(
                        alignment:Alignment.centerLeft,
                        child:Text(
                        "DM Person1",textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white,fontSize:18.0,),),
                      ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .07,
                  decoration: BoxDecoration(

                    color: Colors.black,
                    border: Border.all(

                      color: Colors.white60,
                      width: 0.1,
                    ),

                  ),
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: () { },
                    child: Align(
                      alignment:Alignment.centerLeft,
                      child:Text(
                        "DM Person2",textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white,fontSize:18.0,),),
                    ),
                  ),




                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .07,
                  decoration: BoxDecoration(

                    color: Colors.black,
                    border: Border.all(

                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: RaisedButton(
                    color: Colors.black,
                    onPressed: () { },
                    child: Align(
                      alignment:Alignment.centerLeft,
                      child:Text(
                        "DM Person3",textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white,fontSize:18.0,),),
                    ),
                  ),

                ),

              ],
            ),
          ),

        ],
      ),

    );
  }
}
