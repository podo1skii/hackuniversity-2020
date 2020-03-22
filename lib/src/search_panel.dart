import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'models/book.dart';
import 'models/book_line_view.dart';

class SearchPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPanel();
}

class _SearchPanel extends State<SearchPanel> {
  List<Book> books = [];
  String text = '';
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(
          color: getGreyColor(),
        ),
        Container(
          height: 30.0,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextFormField(
            controller: _searchController,
            onEditingComplete: () async {
              print('Saved!');
              print(_searchController.text);
              final newbooks =  await Application.booksService.searchBooks(_searchController.text);
              setState(() {
                books = newbooks;
              });
              FocusScope.of(context).requestFocus(FocusNode());
            },
            onChanged: (String text){
              print('OnChange');
              setState(() {
                text = text;
              });
            },
            decoration: InputDecoration(
                labelText: 'Search',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 20.0),
          child: Text('Results',
              style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
        ),
        Column(
          children: books.map<Widget>((item)=> BookLineView(item)).toList(),
        )
      ],
    ));
  }
}
