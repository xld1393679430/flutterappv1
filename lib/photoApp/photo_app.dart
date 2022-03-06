import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// 拍照App
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  File _image;

  Future getImage(bool isTakePhoto) async {
    print('-----getImage-----');
    var image = await ImagePicker.pickImage(
        source: isTakePhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拍照App"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: _image == null ? Text("No image selected") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: "选择图片",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) => Container(
              height: 100,
              child: Column(
                children: [
                  // _item("拍照", true),
                  _item("占位", false),
                  _item("从相册选择", false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return Container(
      height: 40,
      child: GestureDetector(
        child: ListTile(
          leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
          title: Text(title),
          onTap: () => getImage(isTakePhoto),
        ),
      ),
    );
  }
}
