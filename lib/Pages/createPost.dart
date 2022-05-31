import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se373_project/Pages/post1.dart';


class createpostPage extends StatefulWidget {
  final String type;
  const createpostPage(this.type) : assert(type != null);

  @override
  State<createpostPage> createState() => _createpostPageState();
}

class _createpostPageState extends State<createpostPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: Text(
            ("Create Post"),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: postolustur());
  }
}


class postolustur extends StatefulWidget {
  const postolustur({Key? key}) : super(key: key);

  @override
  State<postolustur> createState() => _postolusturState();
}

class _postolusturState extends State<postolustur> {

  final _firestore = FirebaseFirestore.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  var _imageFile;
  @override
  Widget build(BuildContext context) {
    TextEditingController _editTextController = TextEditingController();
    ScrollController _scrollController = ScrollController();
    CollectionReference postsRef = _firestore.collection('posts');
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height,
      color: Colors.black,
      child:SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: TextField(
                controller: titleController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
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
                  hintText: 'Label:',
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                controller: labelController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
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
                  hintText: 'Title:',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scrollbar(
              controller: _scrollController,
              child: TextField(
                controller: contentController,
                style: TextStyle(color: Colors.white),
                scrollController: _scrollController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                autocorrect: true,
                onChanged: (s) => {},
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white60),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  contentPadding: EdgeInsets.only(
                      top: 10, bottom: 100, left: 20, right: 80),
                  hintText: 'Content:',
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: _imageFile == null
                            ? Container(
                                child: FlatButton(
                                  onPressed: () {
                                    _getFromGallery();
                                  },
                                  child: Text(
                                    "Pick image from Gallery",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              )
                            : Container(
                                child: Image.file(
                                  _imageFile,
                                  fit: BoxFit.cover,
                                ),
                              ))),
              ),
              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple[800],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: _imageFile == null
                            ? Container(
                                child: FlatButton(
                                onPressed: () {
                                  _getFromCamera();
                                },
                                child: Text(
                                  "Pick image from Camera",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ))
                            : Container(
                                child: Image.file(
                                  _imageFile,
                                  fit: BoxFit.cover,
                                ),
                              ))),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 200),
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.circular(20),
              ),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () async {
                  print(titleController.text);
                  print(labelController.text);
                  print(contentController.text);
                  Map<String, dynamic> postData = {
                    'label': titleController.text,
                    'title': labelController.text,
                    'content': contentController.text
                  };
                  await postsRef.doc(titleController.text).set(postData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => post1Page()),
                  );
                },
                child: Text(
                  'Create Post',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }


  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }


  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }



}
