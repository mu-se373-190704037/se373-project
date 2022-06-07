import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class post1Page extends StatefulWidget {
  @override
  State<post1Page> createState() => _post1PageState();
}

class _post1PageState extends State<post1Page> {
  final firestore = FirebaseFirestore.instance;

  Future<String> gettitle() async {
    final DocumentSnapshot posts =
        await firestore.collection('posts').doc('Bilgilendirme').get();

    return (posts.data() as dynamic)['title'];
  }
  Future<String?> addToArray(dynamic element) async {
    User? currentUser= FirebaseAuth.instance.currentUser;
    if(currentUser!=null) {
      await firestore.collection('posts').doc('Bilgilendirme').update({
        'comments': FieldValue.arrayUnion([element]),
      });
    }
  }
  Future<List<DocumentSnapshot>> getArray() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore
        .collection("posts")
        .get();
    return qn.docs;
  }
  void UpdateUser(dynamic element){
    User? currentUser= FirebaseAuth.instance.currentUser;
    if(currentUser!=null){
    FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: currentUser.email)
        .get()
        .then((querySnapshot) => {
      querySnapshot.docs.forEach((doc) => {
        doc.reference.update({'comments': FieldValue.arrayUnion([element])})
            .then((value) => print("User Updated"))
            .catchError((error) => print("Failed to update user: $error"))
      })
    });
    }


  }

  Future<String?> getCurrentUserEmail() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    final String? email = currentUser?.email.toString();
    print(email);
    return email;
  }
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('posts').snapshots();
    CollectionReference postsRef = firestore.collection('posts');

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: FutureBuilder(
          future: gettitle(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done&& !snapshot.hasData) {
              return SizedBox.shrink();
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
                    /*Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Container(
                        height: 50,
                        width: 200,
                        child: FutureBuilder(
                          future: getCurrentUserEmail(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                snapshot.data,
                                style: GoogleFonts.openSans(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white70,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),*/
                    ConstrainedBox(
                      constraints: new BoxConstraints(maxHeight: 400),
                      child: new Scrollbar(
                        child: ListView(
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
                      padding: EdgeInsets.only(left: 10, top: 9, bottom: 9),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: AutoSizeText(
                          'COMMENTS:',
                          style: GoogleFonts.openSans(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontSize: 15),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white60,
                              width: 0.5,
                            )),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: new BoxConstraints(maxHeight: 70),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 18),
                                child: AutoSizeText(
                                  'Bilgilendirme için teşekkürler.',
                                  style: GoogleFonts.openSans(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: new BoxConstraints(maxHeight: 70),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10, top: 18),
                                child: AutoSizeText(
                                  'Ofis neredeydi, gelip yüzyüze konuşmak istiyordum da.',
                                  style: GoogleFonts.openSans(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white,
                                      fontSize: 15),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            ConstrainedBox(
                              constraints: new BoxConstraints(maxHeight: 70),
                              child: new Scrollbar(
                              child: ListView(
                              scrollDirection: Axis.vertical,
                              reverse: false,
                              children: snapshot.data!.docs.map((field) {
                              return Column(
                              children: <Widget>[
                              ListTile(
                                  title: AutoSizeText(field['comments'].toString(),
                                style: GoogleFonts.openSans(
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white,
                                    fontSize: 15),
                                maxLines: 2,)
                              ),
                              ]
                              );
                              }).toList(),
                              ),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.62,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          minLines: null,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.multiline,
                          controller: commentController,
                          autocorrect: true,
                          onChanged: (s) => {},
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white60),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            contentPadding: EdgeInsets.only(
                                top: 10, bottom: 100, left: 20, right: 80),
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
                        onPressed: () async {

                          addToArray(commentController.text);
                          UpdateUser(commentController.text);
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
