import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'book_info_page.dart';
import 'models/book.dart';

class CommandModule {
  final host = 'http://4f767023.ngrok.io';
  final BuildContext context;

  CommandModule(this.context);

  Future sendCommandResponse(String text) async {
    return Future.delayed(Duration(seconds: 5));
  }

  Future<void> sendPhotoResponse(String path) async {
    final bytes = File(path).readAsBytesSync().toList();
    print(bytes);
    final response = await http.post('$host/image-handler', body: {
      'image': bytes,
    });
    print('Navigate');
    final book = Book.fromJson(response as Map<String, dynamic>);
    Navigator.push(context, MaterialPageRoute(builder: (_)=> BookInfoPage(book)));
  }

}
