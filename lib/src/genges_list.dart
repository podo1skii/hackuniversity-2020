import 'package:bookshop/src/shop_main_page.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'models/genres.dart';

class GenresList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GenresListState();
}

class _GenresListState extends State<GenresList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 533,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0.0, left: 20.0),
                child: Text('Genres', style: getPanelHeaderTextStyle(),),
              ),
              Row(
                children: <Widget>[
                  getItem(Genres.values[0].name),
                  getItem(Genres.values[1].name),
                ],
              ),
              Row(
                children: <Widget>[
                  getItem(Genres.values[2].name),
                  getItem(Genres.values[3].name),
                ],
              ),
              Row(
                children: <Widget>[
                  getItem(Genres.values[4].name),
                  getItem(Genres.values[5].name),
                ],
              ),
              Row(
                children: <Widget>[
                  getItem(Genres.values[6].name),
                ],
              ),
            ],
          ),
        );
  }

  Widget getItem(String name){
    return Container(

      margin: EdgeInsets.only(left:9.0, right: 9.0, top: 10.0,),
      width: 168,
      height: 168,
      decoration: BoxDecoration(
        color: getColor(),
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Center(child: Text(name, maxLines: 5, style: getBookInfoAuthorTextStyle(), textAlign: TextAlign.center,)),
    );
  }

  int i = 0;

  Color getColor() {
    if (i > 7) {
      i = 0;
    }
    final colors = [
      Colors.yellow[200],
      Colors.green[200],
      Colors.blue[200],
      Colors.purple[200],
      Colors.red[200],
      Colors.orange[200],
      Colors.lightBlue[200],
      Colors.pink[200],
    ];
    return colors[i++];
  }

  void changePage(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_)=> ShopMainPage()));
        break;
      case 1:
      case 2:
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_)=> GenresList()));
    }
  }
}
