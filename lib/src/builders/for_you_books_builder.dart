import 'package:bookshop/src/models/book_point_view.dart';
import 'package:bookshop/src/services/books_service.dart';
import 'package:flutter/material.dart';

class ForYouBooksBuilder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ForYouBooksBuilderState();

}

class _ForYouBooksBuilderState extends State<ForYouBooksBuilder> {
  @override
  Widget build(BuildContext context) {
    final books = BooksService().getPopularBooks();
    final bookViews = books.map((book)=> BookPointView(book)).toList();
    return Container(
      height: 300.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: bookViews,
      ),
    );
  }
}
