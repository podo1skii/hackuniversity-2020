import 'package:bookshop/src/models/book_line_view.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'models/book.dart';

class ListViewPage extends StatefulWidget{
  final String genre;

  ListViewPage(this.genre);

  @override
  State<StatefulWidget> createState() => _ListViewPageState(genre);

}

class _ListViewPageState extends State<ListViewPage> {
  final String genre;

  _ListViewPageState(this.genre);

  @override
  Widget build(BuildContext context) {
    print('Genre:' + genre);
    return FutureBuilder(
      future: Application.booksService.getBooksByGenge(genre),
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          print(snapshot.data);
          final views = <Widget>[Container(
            margin: EdgeInsets.only(top: 0.0, left: 20.0),
            child: Text('Results',
                style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
          )];
          views.addAll((snapshot.data != null ? snapshot.data : []).map((book)=> BookLineView(book)).toList());
          return Container(
            height: 533.0,
            child: ListView(
              children: views,
            ),
          );
        } else{
          return Container(
            height: 533.0,
            child: ListView(
              children: [Container(
                margin: EdgeInsets.only(top: 0.0, left: 20.0),
                child: Text('Results',
                    style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
              )],
            ),
          );
        }
      },
    );


  }
}
