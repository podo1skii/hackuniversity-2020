import 'dart:convert';

import 'package:bookshop/src/models/book.dart';
import 'package:http/http.dart' as http;


class BooksService {
  final host = 'http://36dcf65e.ngrok.io';

  List<Book> bufferBooks;

  Future init() async {
    await getPopularBooks(true);
  }

  Future<List<Book>> getPopularBooks(bool isFirst) async {
    if (bufferBooks != null){
      return isFirst ? bufferBooks.sublist(0,9) : bufferBooks.sublist(10);
    }
    final response =  await http.get('$host/get20');
    print(response.statusCode);
    final List listBooks = json.decode(response.body)['data'];
    final books = listBooks.map((item)=> Book.fromJson(item as Map<String, dynamic>)).toList();
    bufferBooks = books;
    return isFirst ? bufferBooks.sublist(0,9) : bufferBooks.sublist(10);
  }
}
