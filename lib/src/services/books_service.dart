import 'package:bookshop/src/models/book.dart';

class BooksService {
  List<Book> getPopularBooks(){
    return [
      Book()..name = 'Winter festival'
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
