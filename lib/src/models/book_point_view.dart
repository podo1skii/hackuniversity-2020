import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:bookshop/src/utils/text_process.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../book_info_page.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=> BookInfoPage(book)));
      },
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 15.0, right: 15.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
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
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                height: 216.0,
                width: 150.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 18.0),
                child: Text(book.name.length > 20? book.name.substring(0, 17) + '...': book.name, style: getBookPointNameTextStyle(), textAlign: TextAlign.left),
              ),
              Container(
                margin: EdgeInsets.only(left: 18.0),
                child: Text(authorPipe(book.author), style: getBookPointAuthorTextStyle(), textAlign: TextAlign.left),
              ),
            ],
          )
      ),
    );
  }

}
