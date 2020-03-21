import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'builders/for_you_books_builder.dart';

class ForYouPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForYouPanelState();
}

class _ForYouPanelState extends State<ForYouPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0.0, left: 20.0),
                child: Text('For you',
                    style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
              )
            ],
          ),
          ForYouBooksBuilder()
        ],
      ),
    );
  }
}
