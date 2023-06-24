import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fsp/DatabaseHelper.dart';
import 'package:fsp/HomePage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class AddContentPage extends StatefulWidget {
  const AddContentPage({Key? key }) : super(key: key);

  @override
  State<AddContentPage> createState() => _AddContentPageState();
}

class _AddContentPageState extends State<AddContentPage> {
  File? _image;
  var _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  TextEditingController _sellerNameController = TextEditingController();
  TextEditingController _sellingPriceController = TextEditingController();
  TextEditingController _sellerPhoneController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _sellerNameController.dispose();
    _sellingPriceController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if(_formKey.currentState!.validate()) {
      final sellerName = _sellerNameController.text;
      final sellingPrice = double.tryParse(_sellingPriceController.text) ?? 0.0;
      final sellerPhone = _sellerPhoneController.text;

      if (sellerName.isNotEmpty && sellingPrice > 0 && _image != null) {
        final imageFilePath = _image!.path;
        final id = await DatabaseHelper.insertForm(
            imageFilePath, sellerName, sellingPrice, sellerPhone);
        print('Form saved with ID: $id');

        // Clear form fields and image after saving
        _sellerNameController.clear();
        _sellingPriceController.clear();
        _sellerPhoneController.clear();

        setState(() {
          _image = null;
        });
      } else {
        print('Please fill in all the fields.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (_image != null) Image.file(_image!),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _sellerNameController,
              decoration: InputDecoration(
                labelText: 'Seller Name',
              ),
              validator: (val){
                if(val == null || val == ''){
                  return 'Please enter Seller name';
                }
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _sellerPhoneController,
              decoration: InputDecoration(
                labelText: 'Seller Phone',
              ),
              keyboardType: TextInputType.phone,
              validator: (val){
                print(val);
                if(val == null || val == ''){
                  return 'Please seller phone no.';
                }
              }
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _sellingPriceController,
              decoration: InputDecoration(
                labelText: 'Selling Price',
              ),
              keyboardType: TextInputType.number,
              validator: (val){
                print(val);
                if(val == null || val == ''){
                  return 'Please enter selling price';
                }
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
