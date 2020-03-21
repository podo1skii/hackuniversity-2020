import 'package:bookshop/src/models/book_line_view.dart';
import 'package:bookshop/src/services/books_service.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

class MarkRateBuilder extends StatefulWidget{
  final double rate;

  MarkRateBuilder(this.rate);

  @override
  State<StatefulWidget> createState() => _MarkRateBuilderState(rate);

}

class _MarkRateBuilderState extends State<MarkRateBuilder> {
  final double rate;
  _MarkRateBuilderState(this.rate);

  @override
  Widget build(BuildContext context) {
    final fullStar = rate.floor();
    final isInt = rate % 1 == 0;
    var fullView = <Widget>[];
    for (var i = 0; i < fullStar; i++){
      fullView.add(Icon(Icons.star, color: Colors.amber[700],size: 16.0,));
    }
    if (!isInt){
      fullView.add(Icon(Icons.star_half, color: Colors.amber[700],size: 16.0,));
    }
    fullView.add(Text('   ${rate.toString()}/5.0', style: getBookInfoRateTextStyle(),));
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: fullView,
      )
    );
  }
}
