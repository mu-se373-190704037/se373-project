import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  final String title;
  const MyPage(this.title) : assert(title != null);
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  /// Variables
  var imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple,
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("PICK FROM GALLERY"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Colors.purple,
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("PICK FROM CAMERA"),
                  )
                ],
              ),
            ):
            Container(
              child: Image.file(
                imageFile,
                fit: BoxFit.cover,
              ),
            )
        )
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path) as Future<PickedFile?>;
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path) as Future<PickedFile?>;
      });
    }
  }
}