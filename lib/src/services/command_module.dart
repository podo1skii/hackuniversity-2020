import 'dart:io';
import 'package:bookshop/src/application.dart';
import 'package:bookshop/src/models/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../book_info_page.dart';


class CommandModule {
  final host = 'http://4f767023.ngrok.io';
  final BuildContext context;

  CommandModule(this.context);

  Future<List<Book>> sendCommandResponse(String text) async {
    print('sendCommandResponse');
    final books = await Application.booksService.getBooksByCommand(text);
    print('Books length:' + books.length.toString());
    if (books.length == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>BookInfoPage(books.first)));
    } else if (books.length > 1){
      print('more 1');
      Application.routing.fireBooks(books);
    }
    return books;
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
