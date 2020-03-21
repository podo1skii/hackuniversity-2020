import 'dart:convert';

import 'package:bookshop/src/models/book.dart';
import 'package:http/http.dart' as http;

class BooksService {
  final host = 'http://a7d67c7a.ngrok.io';

  List<Book> bufferBooks;

  Future<List<Book>> getPopularBooks() async {
    if (bufferBooks != null){
      return bufferBooks;
    }
    final response =  await http.get('$host/get20');
    final List listBooks = json.decode(response.body)['data'];
    print(listBooks[0].toString());
    final books = listBooks.map((item)=> Book.fromJson(item as Map<String, dynamic>)).toList();
    bufferBooks = books;
    return books;
  }

  List<Book> getLibraryBooks(){
    return [
      Book()..name = 'Java 8'
        ..author = 'Steve Jobs'
        ..price = 15.99
        ..linkToImage='https://cdn1.ozone.ru/multimedia/1025459620.jpg'
        ..mark = 4.6,
      Book()..name = 'Time'
        ..author = 'Roman Jobs'
        ..price = 15.99,
      Book()..name = 'Hello DAUN'
        ..author = 'DAUN MAX'
        ..price = 15.99,
      Book()..name = 'Winter festival'
        ..author = 'Steve Jobs'
        ..price = 15.99,
      Book()..name = 'Time'
        ..author = 'Roman Jobs'
        ..price = 15.99,
      Book()..name = 'Hello DAUN'
        ..author = 'DAUN MAX'
        ..price = 15.99,
    ];
  }
}
