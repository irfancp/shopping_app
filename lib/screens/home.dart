import 'package:app/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home_tab_menu.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static PageController pageController = PageController(initialPage: 0);
  var _page = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor:Colors.white,
          body: Container(
            height: height,
            child: Column(
              children: [
                       Container(
                         margin: EdgeInsets.all(20),
                         child: Row(
                                     children: [
                                       Container(
                                         child: Text("Top Rated",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                                       ),
                                       Spacer(),
                                       Icon(Icons.menu),
                       
                                     ],
                                   
                                   ),
                       ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: height / 8,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        HomeTabMenu(
                          currentPage: _page,
                          height: 50,
                          width: width/3,
                          // icon: Icon(Icons.chair),
                          
                          pageNumber: 0,
                          title: Text(
                            "Arm Chair",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: _page == 0?Colors.white:Colors.black),
                          ),
                          onChange: (val) {
                            setState(() {
                              if (val) {
                                pageController.jumpToPage(0);
                              }
                            });
                          },
                        ),
                        HomeTabMenu(
                          currentPage: _page,
                            height: 50,
                          width: width/3,
                       
                          pageNumber: 1,
                          title: Text(
                            "Bed",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: _page == 1?Colors.white:Colors.black),
                          ),
                          onChange: (val) {
                            setState(() {
                              if (val) {
                                pageController.jumpToPage(1);
                              }
                            });
                          },
                        ),
                        HomeTabMenu(
                          currentPage: _page,
                           height: 50,
                          width: width/3,
                          // icon: Icons.,
                          pageNumber: 2,
                          title: Text(
                            "Lamb",
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: _page == 2?Colors.white:Colors.black),
                          ),
                          onChange: (val) {
                            setState(() {
                              if (val) {
                                pageController.jumpToPage(2);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {
                      setState(() {
                        _page = value;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: <Widget>[
                     Products()
                     , Products(),
                      Products()
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}