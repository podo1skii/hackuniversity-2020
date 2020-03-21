import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/shop_list.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'for_you_panel.dart';

class BookInfoPage extends StatefulWidget {
  BookInfoPage(this.book, {Key key, this.title}) : super(key: key);

  final String title;
  final Book book;

  @override
  _BookInfoPageState createState() => _BookInfoPageState(book);
}

class _BookInfoPageState extends State<BookInfoPage> {
  final Book book;

  _BookInfoPageState(this.book);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: getBackgroundAppColor(),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: book.linkToImage != null ? DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(book.linkToImage)
                  ): null,
//                  boxShadow: [
//                    BoxShadow(
//                        color: Color.fromRGBO(100, 100, 100, 1),
//                        blurRadius: 3.0
//                    )
//                  ],
                  color: getBackgroundAppColor(),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0))
              ),
              height: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
