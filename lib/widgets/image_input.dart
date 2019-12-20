import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  __ImageInputState createState() => __ImageInputState();
}

class __ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture(ImageSource imageSource) async{
    final imageFile = await ImagePicker.pickImage(
    source:imageSource,
 );
    setState(() {
        _storedImage = imageFile;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 300,
          height: 350,
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
        Row(
          children: <Widget>[
            Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('take a picture'),
            onPressed:() => _takePicture(ImageSource.camera),
          ),
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.add_photo_alternate),
            label: Text('select a picture'),
            onPressed: () => _takePicture(ImageSource.gallery ),
          ),
          ),
          ],
        )
      ],
    );
  }
}