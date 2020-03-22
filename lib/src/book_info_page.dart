import 'package:bookshop/src/bottom_nav_bar.dart';
import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/shop_list.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:bookshop/src/utils/text_process.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'builders/mark_rate_builder.dart';
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
      bottomNavigationBar: BottomNavBar(book),
      backgroundColor: getBackgroundAppColor(),
      body: Container(
//        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                  image: book.linkToImage != null ? DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(book.linkToImage)
                  ): null,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(100, 100, 100, 1),
                        blurRadius: 3.0
                    )
                  ],
                  color: getBackgroundAppColor(),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))
              ),
              height: 300.0,
            ),
            Text(longNamePipe(book.name), style: getBookInfoNameTextStyle(), textAlign: TextAlign.center,),
            Text(authorPipe(book.author), style: getBookInfoAuthorTextStyle(),),
            book.mark != null ? MarkRateBuilder(book.mark): Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                    border:  Border.all(color: getGreyColor(), width: 2.0)
                  ),
                  height: 50.0,
                  width: 50.0,
                  child: Icon(Icons.share, color: getDarkGreyColor(),),
                  ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                      border:  Border.all(color: getGreyColor(), width: 2.0)
                  ),
                  height: 50.0,
                  width: 50.0,
                  child: Icon(Icons.bookmark_border, color: getDarkGreyColor(),),
                ),
                Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                      border:  Border.all(color: getGreyColor(), width: 2.0)
                  ),
                  height: 50.0,
                  width: 50.0,
                  child: Icon(Icons.star_border, color: getDarkGreyColor(),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                      border:  Border.all(color: getGreyColor(), width: 2.0)
                  ),
                  padding: EdgeInsets.all(15.0),
                  height: 60.0,
                  width: 130.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.short_text, color: getDarkGreyColor(),),
                      Text('Description'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                      border:  Border.all(color: getGreyColor(), width: 2.0)
                  ),
                  padding: EdgeInsets.all(15.0),
                  height: 60.0,
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.chat_bubble_outline, color: getDarkGreyColor(),),
                      Text('Reviews'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  void startPay(){

  }
}
