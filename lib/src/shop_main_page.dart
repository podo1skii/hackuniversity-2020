import 'package:bookshop/src/shop_list.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'for_you_panel.dart';

class ShopMainPage extends StatefulWidget {
  ShopMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopMainPageState createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: getBackgroundAppColor(),
      body: Container(
        child: Column(
          children: <Widget>[
            HeaderAppBar(),
            Container(
              height: 563.0,
              child: ListView(
                children: <Widget>[
                  ForYouPanel(),
                  ShopList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
