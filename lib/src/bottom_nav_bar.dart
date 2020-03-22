import 'package:bookshop/src/models/book.dart';
import 'package:bookshop/src/payment_page.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'application.dart';

class BottomNavBar extends StatefulWidget {
  final Book book;

  const BottomNavBar(this.book);

  @override
  State<StatefulWidget> createState() => _BottomNavBarState(book);
}

class _BottomNavBarState extends State<BottomNavBar> {
  final Book book;

  _BottomNavBarState(this.book);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: getGreyColor(), blurRadius: 5.0)
        ],
          color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
      ),
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(59,86,233, 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0), ),
                border:  Border.all(color: Colors.transparent, width: 2.0)
            ),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
            height: 60.0,
            width: 250.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${book.price.toInt().toString()} RUB', style: getBottomTextStyle(),),
                GestureDetector(
                  onTap: () async{
                    print('PAY');
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>PaymentPage(book)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(color: Colors.transparent)
                    ),
                    padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 15.0, right: 15.0),
                    child: Text('Buy now', style: getBottomTextStyle()),
                  ),
                )
              ],
            ),

          ),
          Container(
            height: 60.0,
            width: 80.0,
            decoration: BoxDecoration(
              color: getBackgroundAppColor(),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.transparent)
            ),
            child: Icon(Icons.store_mall_directory, color: getDarkGreyColor(),),
          )
        ],
      )
    );
  }
}
