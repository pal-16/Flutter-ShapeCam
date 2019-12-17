import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  __ImageInputState createState() => __ImageInputState();
}

class __ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture() async{
    final imageFile = await ImagePicker.pickImage(
    source:ImageSource.camera,
    maxWidth:600,
 );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('no image taken',textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('take a picture'),
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}