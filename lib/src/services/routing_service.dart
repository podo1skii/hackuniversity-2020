import 'dart:async';

import 'package:bookshop/src/models/Books.dart';
import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/models/genres.dart';

class RoutingService {
  final _onChange = StreamController<int>();
  final _onChangeGenre = StreamController<String>();
  final _onChangeBooks = StreamController<Books>();
  String genre = Genres.world.name;

  Stream<int> get onChange => _onChange.stream;
  Stream<String> get onChangeGenre => _onChangeGenre.stream;
  Stream<Books> get onChangeBooks => _onChangeBooks.stream;

  void fire(int i){
    _onChange.add(i);
  }

  void fireGenre(String genre) {
    _onChangeGenre.add(genre);
  }

  void fireBooks(List<Book> books) {
    print('Fire Books: '+ books.length.toString());
    _onChangeBooks.add(Books(books));
  }
}
