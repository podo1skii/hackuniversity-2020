import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

class BookPointView extends StatefulWidget{
  final Book book;
  BookPointView(this.book);
  @override
  State<StatefulWidget> createState() => _BookPointViewState(book);

}

class _BookPointViewState extends State<BookPointView> {
  final Book book;
  _BookPointViewState(this.book);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 15.0, right: 15.0),
            decoration: BoxDecoration(
              image: book.linkToImage != null ? DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(book.linkToImage)
              ): null,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(100, 100, 100, 1),
                  blurRadius: 3.0
                )
              ],
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            height: 216.0,
            width: 150.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 18.0),
            child: Text(book.name, style: getBookPointNameTextStyle(), textAlign: TextAlign.left),
          ),
          Container(
            margin: EdgeInsets.only(left: 18.0),
            child: Text(book.author, style: getBookPointAuthorTextStyle(), textAlign: TextAlign.left),
          ),
        ],
      )
    );
  }

}
