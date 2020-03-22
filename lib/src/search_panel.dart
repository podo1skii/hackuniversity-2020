import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';


class SearchPanel extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SearchPanel();

}

class _SearchPanel extends State<SearchPanel> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(color: Colors.grey[200],),
          Container(
            height: 30.0,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                  filled: true,
                  fillColor: getGreyColor(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  )
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 20.0),
            child: Text('Results',
                style: getPanelHeaderTextStyle(), textAlign: TextAlign.left),
          ),

        ],
      )
    );
  }
}
