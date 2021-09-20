import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
        double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
                                       children: [
                                            Spacer(),
                                         Container(
                                           child: Text("147 Products",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                                         ),
                                         Spacer(),
                                        Text("Most popular",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                           Spacer(),
                         
                                       ],
                                     
                                     ),
                                     Container(
                                       child: GridView.count(
                                         shrinkWrap: true,
                                         physics: NeverScrollableScrollPhysics(),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(6, (index) {
          return  Container(
                                          margin: index%2 ==0 ? EdgeInsets.only(left: 10,bottom: 10,right: 10,top: 5):EdgeInsets.only(top: 30,right: 20),
      
                                         decoration: BoxDecoration(
                                           color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(20),
                                           
                                         ),
                                         child: Column(children: [
                                           Container(
                                             height: 120,
                                             width: width/2.5,
                                             child: Image.asset("images/chair-removebg-preview.png")),
                                           Container(
                                             margin: EdgeInsets.only(left: 20),
                                             alignment: Alignment.centerLeft,
                                             child: Text("Tortor Chair"),
                                           ),
                                            Row(
                                         children: [
                                             
                                           Container(
                                                  margin: EdgeInsets.only(left: 20),
                                             child: Text("\$256",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),
                                           ),
                                           Spacer(),
                                          Text("4.5",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                                             Spacer(),
                                                                
                                         ],
                                                                              
                                                                              ),
                                         ],),
                                       );
        }),
      ),
                                     ),
      
                                  
      
          ],
        ),
      ),

    );
  }
}