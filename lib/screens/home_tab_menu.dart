import 'package:flutter/material.dart';

class HomeTabMenu extends StatefulWidget {
  final Widget title;
  final Widget icon;
  final int pageNumber;
  final int currentPage;
  final double width;
  final double height;
  final ValueChanged<bool> onChange;

  HomeTabMenu(
      {Key key,
      this.title,
      this.icon,
      this.pageNumber,
      this.width,
      this.height,
      this.currentPage,
      this.onChange})
      : super(key: key);

  @override
  _HomeTabMenuState createState() => _HomeTabMenuState();
}

class _HomeTabMenuState extends State<HomeTabMenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        margin: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 8), child: widget.icon),
              // Icon(Icons.calendar_today_outlined,color: _mainColor,size: 20,),
              Padding(padding: const EdgeInsets.all(8.0), child: widget.title)
            ],
          ),
          width: widget.width,
          height: widget.height,
          decoration: widget.currentPage == widget.pageNumber
              ? BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)))
              : BoxDecoration(
                color: Colors.grey[200],
                  //         border: Border.all(
                  //   color: Colors.black45,
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(12)))
              ),
      onTap: () {
        setState(() {
          widget.onChange(true);
        });
      },
    );
  }
}
