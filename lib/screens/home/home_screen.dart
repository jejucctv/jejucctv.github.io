import 'package:flutter/material.dart';
import 'package:jejucctv/screens/dashboard/dashboard.dart';
import 'package:jejucctv/utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int active = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 1, initialIndex: 0)
      ..addListener(() {
        setState(() {
          active = _tabController.index;
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 32),
                child: Text(
                  "제주도 CCTV",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
        actions: <Widget>[
          // InkWell(
          //   onTap: () {
          //     print("download");
          //   },
          //   child: Container(
          //     margin: EdgeInsets.all(12),
          //     padding: EdgeInsets.all(8),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(5),
          //       color: Colors.white,
          //     ),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: <Widget>[
          //         Icon(
          //           Icons.cloud_download,
          //           color: Colors.black,
          //           size: 22,
          //         ),
          //         SizedBox(
          //           width: 4,
          //         ),
          //         Text(
          //           "Download Now",
          //           style: TextStyle(
          //             fontSize: 12,
          //             color: Colors.black,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // SizedBox(width: 32),
          // Container(child: Icon(Icons.web)),
          // SizedBox(width: 32),
          Container(
              child: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                  },
              )
          ),
          SizedBox(width: 10),
          // Container(
          //   child: IconButton(
          //     padding: EdgeInsets.all(0),
          //     icon: Icon(Icons.exit_to_app),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          // SizedBox(width: 32),
        ],
        backgroundColor: ColorConstants.blue,
        // automaticallyImplyLeading: false,
      ),
      body: Row(
        children: <Widget>[
          // MediaQuery.of(context).size.width < 1300
          //     ? Container()
          //     : Card(
          //         elevation: 2.0,
          //         child: Container(
          //             margin: EdgeInsets.all(0),
          //             height: MediaQuery.of(context).size.height,
          //             width: 300,
          //             color: Colors.white,
          //             child: listDrawerItems(false)),
          //       ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Dashboard(),
              ],
            ),
          )
        ],
      ),
      drawer: Padding(
          padding: EdgeInsets.only(top: 56),
          child: Drawer(child: listDrawerItems(false))),
    );
  }

  Widget listDrawerItems(bool drawerStatus) {
    return ListView(
      children: <Widget>[
        FlatButton(
          color: _tabController.index == 0 ? Colors.grey[100] : Colors.white,
          //color: Colors.grey[100],
          onPressed: () {
            _tabController.animateTo(0);
            drawerStatus ? Navigator.pop(context) : print("");
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
              child: Row(children: [
                Icon(Icons.dashboard),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "CCTV",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
        ),
        // FlatButton(
        //   color: tabController.index == 1 ? Colors.grey[100] : Colors.white,
        //   onPressed: () {
        //     print(tabController.index);
        //     tabController.animateTo(1);
        //     drawerStatus ? Navigator.pop(context) : print("");
        //   },
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Container(
        //       padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
        //       child: Row(children: [
        //         Icon(Icons.exit_to_app),
        //         SizedBox(
        //           width: 8,
        //         ),
        //         Text(
        //           "Forms",
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontFamily: 'HelveticaNeue',
        //           ),
        //         ),
        //       ]),
        //     ),
        //   ),
        // ),
        // FlatButton(
        //   color: tabController.index == 2 ? Colors.grey[100] : Colors.white,
        //   onPressed: () {
        //     tabController.animateTo(2);
        //     drawerStatus ? Navigator.pop(context) : print("");
        //   },
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Container(
        //       padding: EdgeInsets.only(top: 22, bottom: 22, right: 22),
        //       child: Row(children: [
        //         Icon(Icons.category),
        //         SizedBox(
        //           width: 8,
        //         ),
        //         Text(
        //           "Hero",
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontFamily: 'HelveticaNeue',
        //           ),
        //         ),
        //       ]),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
