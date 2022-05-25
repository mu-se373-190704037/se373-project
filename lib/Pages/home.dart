import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se373_project/Pages/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se373_project/Pages/post1.dart';

class homePage extends StatefulWidget {
  final String title;
  const homePage(this.title) : assert(title != null);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text("UYGULAMA"),
          centerTitle: true,
        ),
        body: anasayfa());
  }
}

class anasayfa extends StatefulWidget {
  anasayfa({Key? key}) : super(key: key);

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference postsRef = _firestore.collection('posts');
    var erasmusref = postsRef.doc('2022 Erasmus');
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.purple[700],
      child: Column(
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height * .825,
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Container(
                    width: screenSize.width,
                    height: screenSize.height * .09,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.white60,
                        width: 0.1,
                      ),
                    ),
                    child: FlatButton(
                      onPressed: ()  {
                        Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => post1Page()),
                              );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          '2022 Erasmus Programı Hakkında',
                          style: GoogleFonts.openSans(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 18),
                          maxLines: 2,
                        ),
                      ),
                    )),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  height: screenSize.height * .09,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white60,
                      width: 0.1,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 18),
                    child: AutoSizeText(
                      '2022 Erasmus Programı hakkında konuşma olacaktır bilgilendirme için içeriği okuyunuz.',
                      style: GoogleFonts.openSans(
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontSize: 15),
                      maxLines: 2,
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
