import 'package:flutter/material.dart';

import 'home.dart';

class NavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavBarState();
  }
}

class NavBarState extends State<NavBar> {
  bool clickedCentreFAB = false; 
  int selectedIndex = 0; 
    PageController _pageController = PageController();
      List<Widget> _screens = [Home()];


  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
           double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
            
               PageView(
                controller: _pageController,
                children: _screens,
                onPageChanged: updateTabSelection,
                physics: NeverScrollableScrollPhysics(),
              ),
          
          //this is the code for the widget container that comes from behind the floating action button (FAB)
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              child: Center(
                child: Container(
                  // height: height/10,
                  child: Column(children: [
                    Container(
                      width: width/2,
                      margin: EdgeInsets.only(top: height/1.5),
                 
                      // padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),

                        color: Colors.grey.withOpacity(0.5)
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text("Elementum chair",style: TextStyle(color: Colors.white
                            ),),
                          ),
                             Container(
                               margin: EdgeInsets.all(30),
                               child: Row(
                                         children: [
                                              Spacer(),
                                           Container(
                                             child: Text("4.6",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                                           ),
                                           Spacer(),
                                          Text("224.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
                                             Spacer(),
                         
                                         ],
                                       
                                       ),
                             ),
                        ],
                      ),
                    ),
                  ],),
                ),
              ),

              duration: Duration(milliseconds: 250),
              height:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width: clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: Colors.black),
                
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB; //to update the animated container
          });
        },
        tooltip: "Centre FAB",
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.shopping_bag_outlined),
        ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(

        child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.search,
                  color: selectedIndex == 1
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2);
                },
                
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: selectedIndex == 2
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
          
                onPressed: () {
                  updateTabSelection(3);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.person,
                  color: selectedIndex == 3
                      ? Colors.black
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: CircularNotchedRectangle(
        
        ),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}