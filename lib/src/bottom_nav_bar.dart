import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';

import 'application.dart';

class BottomNavBar extends StatefulWidget {
  final double price;

  const BottomNavBar(this.price);

  @override
  State<StatefulWidget> createState() => _BottomNavBarState(price);
}

class _BottomNavBarState extends State<BottomNavBar> {
  final double price;

  _BottomNavBarState(this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
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
                Text('${price.toInt().toString()} RUB', style: getBottomTextStyle(),),
                GestureDetector(
                  onTap: () async{
                    print('PAY');
                    await Application.payment.makePayment(price);
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
