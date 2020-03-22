import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:bookshop/src/utils/text_process.dart';
import 'package:flutter/material.dart';

import '../book_info_page.dart';

class BookLineView extends StatefulWidget{
  final Book book;
  final bool isShort;
  BookLineView(this.book, {this.isShort: false});
  @override
  State<StatefulWidget> createState() => _BookLineViewState(book, isShort: isShort);

}

class _BookLineViewState extends State<BookLineView> {
  final Book book;
  final bool isShort;

  _BookLineViewState(this.book, {this.isShort: false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => BookInfoPage(book)));
      },
      child: Container(
          child: Row(
            children: <Widget>[
              Container( //avatar image
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
                height: 72.0,
                width: 50.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                width: isShort? 200: 280.0,
                height: 82.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(namePipe(book.name, width: 25), style: getBookLineNameTextStyle(),),
                            Text(authorPipe(book.author), style: getBookLineAuthorTextStyle()),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.amber[700],size: 16.0,),
                            Text(book.mark.toString())
                          ],
                        )
                      ],
                    ),
                    !isShort ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.bookmark_border),
                        Text('${book.price.toInt().toString()} RUB', style: getBookLinePriceTextStyle(),),
                      ],
                    ) : Container()
                  ],
                )
              )
            ],
          )
      ),
    );
  }

}
