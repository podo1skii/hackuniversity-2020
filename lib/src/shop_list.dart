import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'builders/shop_list_books_builder.dart';

class ShopList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ShopListState();

}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text('Popular',
                  style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
            ),
            ShopListBooksBuilder()
          ],
      )
    );
  }

}
