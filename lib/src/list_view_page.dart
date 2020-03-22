import 'package:bookshop/src/models/book_line_view.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'models/book.dart';

class ListViewPage extends StatefulWidget {
  final List<Book> books;

  ListViewPage(this.books);

  @override
  State<StatefulWidget> createState() => _ListViewPageState(books);
}

class _ListViewPageState extends State<ListViewPage> {
  final List<Book> books;

  _ListViewPageState(this.books);

  @override
  Widget build(BuildContext context) {
    final views = <Widget>[
      Container(
        margin: EdgeInsets.only(top: 0.0, left: 20.0),
        child: Text('Results',
            style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
      )
    ];
    views.addAll((books != null ? books : [])
        .map((book) => BookLineView(book))
        .toList());
    return Container(
      height: 533.0,
      child: ListView(
        children: views,
      ),
    );
  }
}
