import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/models/book_line_view.dart';
import 'package:bookshop/src/services/books_service.dart';
import 'package:bookshop/src/services/services.dart';
import 'package:flutter/material.dart';

class ShopListBooksBuilder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ShopListBooksBuilderState();

}

class _ShopListBooksBuilderState extends State<ShopListBooksBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Services.booksService.getPopularBooks(false),
        builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              return Container(
                child: Column(
                  children: snapshot.data.map((book)=> BookLineView(book)).toList(),
                ),
              );
            } else {
              return Container();
            }
        }
    );
  }
}
