import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

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
  final firestore = FirebaseFirestore.instance;
  Future<String> gettitle() async {
    final DocumentSnapshot posts =
        await firestore.collection('posts').doc('Bilgilendirme').get();

    return (posts.data() as dynamic)['title'];
  }

  @override
  Widget build(BuildContext context) {
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
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => post1Page()),
                        );
                      },
                      child: FutureBuilder(
                        future: gettitle(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done&& !snapshot.hasData) {
                            return SizedBox.shrink();
                          }
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(snapshot.data,
                                style: GoogleFonts.openSans(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                  fontSize: 18,
                                )),
                          );
                        },
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
