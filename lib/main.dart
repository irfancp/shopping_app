import 'package:app/screens/home.dart';
import 'package:app/screens/navBar.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   bool clickedCentreFAB = false;

    static List<Widget> _widgetOptions = <Widget>[
    Home(),
     Home(),
      Home(),
        Home(),
     Home(),
      Home(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

 PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
       double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
      
    backgroundColor: Colors.blueAccent,
    floatingActionButton: Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        children: [
               RaisedButton(
                 child: Text("text"),
                 onPressed: () {},
               ),
             AnimatedContainer(
               duration: Duration(milliseconds: 250),
               //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
               height:
                   clickedCentreFAB ? MediaQuery.of(context).size.height/1.2 : 10.0,
               width: clickedCentreFAB ? MediaQuery.of(context).size.height/1.2 : 10.0,
               decoration: BoxDecoration(
                   borderRadius:
                       BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                   color: Colors.blue),
             ),
          SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: () {
                         setState(() {
                clickedCentreFAB = !clickedCentreFAB; //to update the animated container
              });
    //         showGeneralDialog(
    // barrierColor: Colors.black.withOpacity(0.5),
    // transitionBuilder: (context, a1, a2, widget) {
    //   final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;      return Transform(
    //     transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
    //     child: Opacity(
    //       opacity: a1.value,
    //       child: AlertDialog(
              
    //         shape: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(16.0)),
    //         title: Text('Hello!!'),
    //         content: Text('How are you?'),
    //       ),
    //     ),
    //   );
    // },
    // transitionDuration: Duration(milliseconds: 200),
    // barrierDismissible: true,
    // barrierLabel: '',
    // context: context,
    // pageBuilder: (context, animation1, animation2) {

    // });

              },
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  shape: BoxShape.circle,
                 color: Colors.black
                ),
                child: Icon(Icons.shopping_bag_outlined,size: 40),
              ),
            ),
          ),
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: new Container(
      height: 80.0,
      color: Colors.white,
      padding: new EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          new BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:_selectedIndex ,
              selectedItemColor: Colors.black,

               onTap: _onItemTapped,
               items: [
                BottomNavigationBarItem(
                    icon: new Icon(Icons.home,),
                    title: _selectedIndex == 0? Text('.'): Container(),
                    backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.search),
                  title: new Text(''),
                ),
BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_border,color: Colors.transparent,),
                    title: Text('')
                ),

                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    title: Text('')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('')
                ),

              ]),
        ],
      ),
    ),
       body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
  );
  }
}
