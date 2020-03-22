import 'dart:convert';

import 'package:bookshop/src/models/book.dart';
import 'package:http/http.dart' as http;

class BooksService {
  final host = 'http://207ae58c.ngrok.io';

  List<Book> mainBufferBooks;
  List<Book> resultsBufferBooks;
  String _currentGenre;

  Future init() async {
    await getPopularBooks(true);
  }

  Future<List<Book>> getPopularBooks(bool isFirst) async {
    if (mainBufferBooks != null) {
      return isFirst ? mainBufferBooks.sublist(0, 9) : mainBufferBooks.sublist(10);
    }
    print('GetPopularBooks');
    final response = await http.get('$host/get20');
    final List listBooks = json.decode(response.body)['data'];
    final books = listBooks
        .map((item) => Book.fromJson(item as Map<String, dynamic>))
        .toList();
    mainBufferBooks = books;
    return isFirst ? mainBufferBooks.sublist(0, 9) : mainBufferBooks.sublist(10);
  }

  Future<List<Book>> getBooksByGenge(String genre) async {
    print('GetBooksByGenre');
    if (genre == '' || resultsBufferBooks != null && _currentGenre == genre) {
      return resultsBufferBooks;
    }
    final response = await http.post('$host/get-theme',
        body: jsonEncode({
          'theme': genre,
        }));
    print('Response:' + response.statusCode.toString());
    final List listBooks = json.decode(response.body)['data'];
    print('Response1:' + listBooks.toString());
    final books = listBooks
        .map((item) => Book.fromJson(item as Map<String, dynamic>))
        .toList();
    _currentGenre = genre;
    resultsBufferBooks = books;
    return books == null ? [] : books;
  }

  List<Book> getLibraryBooks() {
    return [
      Book()
        ..name = 'Java 8'
        ..author = 'Steve Jobs'
        ..price = 15.99
        ..linkToImage = 'https://cdn1.ozone.ru/multimedia/1025459620.jpg'
        ..mark = 4.6,
      Book()
        ..name = 'Time'
        ..author = 'Roman Jobs'
        ..price = 15.99,
      Book()
        ..name = 'Hello DAUN'
        ..author = 'DAUN MAX'
        ..price = 15.99,
      Book()
        ..name = 'Winter festival'
        ..author = 'Steve Jobs'
        ..price = 15.99,
      Book()
        ..name = 'Time'
        ..author = 'Roman Jobs'
        ..price = 15.99,
      Book()
        ..name = 'Hello DAUN'
        ..author = 'DAUN MAX'
        ..price = 15.99,
    ];
  }

  Future<List<Book>> getBooksByCommand(String text) async {
    print('GetBooksByCommand');
    final response = await http.post('$host/audio-handler',
        body: jsonEncode({
          'command': text,
        }));
    print('Response:' + response.statusCode.toString());
    print('Res:' + response.body);
    final List listBooks = json.decode(response.body)['data'];
    print('Response1:' + listBooks.toString());
    final books = listBooks
        .map((item) => Book.fromJson(item as Map<String, dynamic>))
        .toList();
    return books == null ? [] : books;
  }
}
