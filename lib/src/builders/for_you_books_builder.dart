import 'package:bookshop/src/models/book.dart';
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
    return FutureBuilder(
        builder:
    (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return Container(
              height: 300.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data.map((book)=> BookPointView(book)).toList(),
              ),
            );
          } else{
            return Container();
          }
    } , future: BooksService().getPopularBooks());
  }
}
