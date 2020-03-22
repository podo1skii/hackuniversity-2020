import 'dart:async';

import 'package:bookshop/src/models/genres.dart';

class RoutingService {
  final _onChange = StreamController<int>();
  final _onChangeGenre = StreamController<String>();
  String genre = Genres.world.name;

  Stream<int> get onChange => _onChange.stream;
  Stream<String> get onChangeGenre => _onChangeGenre.stream;

  void fire(int i){
    _onChange.add(i);
  }

  void fireGenre(String genre) {
    _onChangeGenre.add(genre);
  }
}
