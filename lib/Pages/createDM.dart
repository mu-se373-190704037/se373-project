import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se373_project/Pages/directMessage.dart';

class createDMPage extends StatefulWidget {
  const createDMPage({Key? key}) : super(key: key);

  @override
  State<createDMPage> createState() => _createDMPageState();
}


class _createDMPageState extends State<createDMPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: dmolustur());
  }
}


class dmolustur extends StatefulWidget {
  const dmolustur({Key? key}) : super(key: key);

  @override
  State<dmolustur> createState() => _dmolusturState();
}

class _dmolusturState extends State<dmolustur> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.black,
      child:Column(
        children: [
        Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                child: TextField(
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
                    hintText: 'Kime:',
                  ),
                ),
              ),
            ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                maxLines: null,
                minLines: null,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white,),

                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  contentPadding: EdgeInsets.only(top:10,bottom: 50, left: 20,right: 50),
                  hintText: 'İleti:',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),

              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DMPage('2')),

                );
              },
            ),
          )
        ],
      ),
    );
  }
}

