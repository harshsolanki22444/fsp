import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fsp/DatabaseHelper.dart';

class ContentsPage extends StatefulWidget {
  const ContentsPage({Key? key}) : super(key: key);

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  List<Map<String, dynamic>> _formDataList = [];

  @override
  void initState() {
    super.initState();
    _loadFormDataList();
  }

  Future<void> _loadFormDataList() async {
    final formDataList = await DatabaseHelper.getAllForms();
    setState(() {
      _formDataList = formDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _formDataList.length,
      itemBuilder: (context, index) {
        final formData = _formDataList[index];
        final imageFilePath = formData['image'];
        final itemName = formData['itemName'];
        final sellerName = formData['sellerName'];
        final sellingPrice = formData['sellingPrice'];
        final sellerPhone = formData['sellerPhone'];

        return ListTile(
          leading: imageFilePath != null
              ? Container(
            height: 300, // specify the desired height
            width: 200, // specify the desired width
            child: Image.file(
              File(imageFilePath),
              fit: BoxFit.cover,
            ),
          )
              : Container(),
          title: Text(sellerName),
          subtitle: Text(
            'Selling Price: $sellingPrice \nSelling Phone: $sellerPhone',
          ),
        );
      },
    );
  }
}
