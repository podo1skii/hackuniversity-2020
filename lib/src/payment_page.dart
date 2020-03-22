import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';


class PaymentPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PaymentPageState();

}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(59,86,233, 1),
      body: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              width: 200.0,
              child: Text('Payment',
                  style: getWhitePanelHeaderTextStyle(), textAlign: TextAlign.left),
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              padding: EdgeInsets.only(left:15.0, right: 15.0, top: 30.0, bottom: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Color.fromRGBO(226,232,255, 1),
                boxShadow: [
                  BoxShadow(color: getDarkGreyColor(), blurRadius: 5.0)
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address', textAlign: TextAlign.start, style: getHeaderPaymentTextStyle()),
                  TextFormField(decoration: getDecorator(),),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 100.0,
                          margin: EdgeInsets.only(right: 20.0),
                          child: Column(
                            children: <Widget>[
                              Text('House number',textAlign: TextAlign.start, style: getHeaderPaymentTextStyle()),
                              TextFormField(decoration: getDecorator()),
                            ],
                          ),
                        ),
                        Container(
                          width: 100.0,
                          child: Column(
                            children: <Widget>[
                              Text('Flat number',textAlign: TextAlign.start, style: getHeaderPaymentTextStyle()),
                              TextFormField(decoration: getDecorator()),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 80.0,
                width: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('lib/images/ApplePay.png'))
                )
            )
          ],
        ),
      ),
    );
  }

  InputDecoration getDecorator(){
    return InputDecoration(
//      filled: true,
//      fillColor: Colors.pink[100],
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
    );
  }
}
