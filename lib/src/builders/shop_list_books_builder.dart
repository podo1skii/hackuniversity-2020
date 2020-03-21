import 'package:bookshop/src/models/book_line_view.dart';
import 'package:bookshop/src/services/books_service.dart';
import 'package:flutter/material.dart';

class ShopListBooksBuilder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ShopListBooksBuilderState();

}

class _ShopListBooksBuilderState extends State<ShopListBooksBuilder> {
  @override
  Widget build(BuildContext context) {
    final books = BooksService().getLibraryBooks();
    print(books[0].name);
    final bookViews = books.map((book)=> BookLineView(book)).toList();
    return Container(
      child: Column(
        children: bookViews,
      ),
    );
  }
}
