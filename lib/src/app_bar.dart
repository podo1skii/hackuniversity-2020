//import 'package:bookshop/src/services/avatar_service.dart';
import 'package:bookshop/src/scan_page.dart';
import 'package:bookshop/src/services/avatar_service.dart';
import 'package:bookshop/src/services/user_service.dart';
import 'package:bookshop/src/speech.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera_view.dart';

class HeaderAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeaderAppBarState();
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  SpeechModule speech;

  @override
  Widget build(BuildContext context) {
    final image = AvatarService.getAvatarByUser(1);
    final name = UserService.getNameById(1);
    return Container(
      margin: EdgeInsets.only(top: 24.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: image
                      ))),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                    '$name',
                    style: getHeaderNameTextStyle()),
              )
            ],
          ),
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  final cameras = await availableCameras();
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ScanPage()));
                },
                child: Icon(IconData(0xe3c2, fontFamily: 'MaterialIcons'), size: 25.0,),
              )
            ],
          )
        ],
      )
    );
  }
}
