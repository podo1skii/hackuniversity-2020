import 'package:bookshop/src/shop_list.dart';
import 'package:bookshop/src/speech_page.dart';
import 'package:bookshop/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import 'app_bar.dart';
import 'application.dart';
import 'for_you_panel.dart';
import 'genges_list.dart';
import 'list_view_page.dart';
import 'models/genres.dart';

class ShopMainPage extends StatefulWidget {
  ShopMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ShopMainPageState createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage> {
  Widget container;
  int currentIndex;

  _ShopMainPageState(){
    Application.routing.onChangeGenre.listen((String genre){
      print('Genre stream:' + genre);
      setState(() {
        currentIndex = 3;
        container = ListViewPage(genre);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    container = Container(
            height: 533.0,
            child: ListView(
              children: <Widget>[
                ForYouPanel(),
                ShopList()
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    print(container);
    return Scaffold(
        floatingActionButton: Speech(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end,
          //new
          hasNotch: true,
          //new
          hasInk: true,
          //new, gives a cute ink effect
          inkColor: Colors.black12,
          //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple,
                icon: Icon(Icons.dashboard, color: Colors.black,),
                activeIcon: Icon(Icons.dashboard, color: Colors.deepPurple,),
                title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: Colors.green,
                icon: Icon(Icons.menu, color: Colors.black,),
                activeIcon: Icon(Icons.menu, color: Colors.green,),
                title: Text("Genres")),
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple,
                icon: Icon(Icons.access_time, color: Colors.black,),
                activeIcon: Icon(Icons.access_time, color: Colors.deepPurple,),
                title: Text("Logs")),
            BubbleBottomBarItem(backgroundColor: Colors.indigo,
                icon: Icon(Icons.folder_open, color: Colors.black,),
                activeIcon: Icon(Icons.folder_open, color: Colors.indigo,),
                title: Text("Books")),
          ],
        ),
        backgroundColor: getBackgroundAppColor(),
        body: Container(
          child: Column(
            children: <Widget>[
              HeaderAppBar(),
              container,
            ],
          ),
        )
    );
  }

  void changePage(int index) {
    switch (index) {
      case 0:
        setState(() {
          currentIndex = index;
          container = Container(
            height: 533.0,
            child: ListView(
              children: <Widget>[
                ForYouPanel(),
                ShopList()
              ],
            ),
          );
        });
        break;
      case 1:
        setState(() {
          currentIndex = index;
          container = GenresList();
        });
        break;
      case 2:
      case 3:
        setState(() {
          currentIndex = index;
          container = ListViewPage('');
        });
    }
  }
}
