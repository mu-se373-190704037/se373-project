import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class post1Page extends StatefulWidget {
  @override
  State<post1Page> createState() => _post1PageState();
}

class _post1PageState extends State<post1Page> {
  final firestore = FirebaseFirestore.instance;

  Future<String> gettitle() async {
    final DocumentSnapshot posts =
        await firestore.collection('posts').doc('2022 Erasmus Hakkında').get();

    return (posts.data() as dynamic)['title'];
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('posts').snapshots();

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: FutureBuilder(
          future: gettitle(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return AutoSizeText(snapshot.data,
              style: GoogleFonts.openSans(
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: LikeButton(
              circleColor:
                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
              bubblesColor: BubblesColor(
                dotPrimaryColor: Color(0xff33b5e5),
                dotSecondaryColor: Color(0xff0099cc),
              ),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                );
              },
              likeCount: 0,
              countBuilder: (int? count, bool isLiked, String text) {
                var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "0",
                    style: TextStyle(color: color),
                  );
                } else
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                return result;
              },
            ),
          ),
        ],
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        child: ConstrainedBox(
          constraints: new BoxConstraints(maxHeight: 450),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container(
                width: screenSize.width,
                height: screenSize.height * .825,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: new BoxConstraints(maxHeight: 400),
                      child: new Scrollbar(
                        child:ListView(
                          scrollDirection: Axis.vertical,
                        reverse: false,
                        children: snapshot.data!.docs.map((document) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 5, top: 18),
                                child: AutoSizeText(document['content'],
                                    style: GoogleFonts.openSans(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white70,
                                    ))),
                          );
                        }).toList(),
                      ),
              ),
                    ),
                    Padding(

                      padding: EdgeInsets.only(left: 10,top:9,bottom: 9),

                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child:AutoSizeText('COMMENTS:',
                          style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                          maxLines: 2,),),


                    ),
                    Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white60,
                              width: 0.5,
                            )
                        ),
                        child:ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: new BoxConstraints(
                                  maxHeight: 70),

                              child: Padding(
                                padding: EdgeInsets.only(left: 10,top: 18),
                                child: AutoSizeText('Bilgilendirme için teşekkürler.',
                                  style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                                  maxLines: 2,),

                              ),
                            ),
                            ConstrainedBox(
                              constraints: new BoxConstraints(
                                  maxHeight: 70),

                              child: Padding(
                                padding: EdgeInsets.only(left: 10,top: 18),
                                child: AutoSizeText('Ofis neredeydi, gelip yüzyüze konuşmak istiyordum da.',
                                  style: GoogleFonts.openSans(fontStyle: FontStyle.normal,color: Colors.white,fontSize: 15),
                                  maxLines: 2,),
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.62,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: TextField(
                          textAlignVertical:TextAlignVertical.top,
                          maxLines: null,
                          minLines: null,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white,),
                          keyboardType: TextInputType.multiline,
                          //controller: commentController,
                          autocorrect: true,
                          onChanged: (s) => {},
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white60),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),

                            contentPadding: EdgeInsets.only(top:10,bottom: 100, left: 20,right: 80),
                            labelText: 'Comment:',
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.send,

                          color: Colors.purple[800],
                        ),

                        onPressed: ()  {

                          /*print(commentController.text);
                          Map<String, dynamic> erasmusData = {
                            'comment': commentController.text
                          };
                          await erasmusRef.(commentController.text).set(erasmusData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => post1Page()),
                          );*/

                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
