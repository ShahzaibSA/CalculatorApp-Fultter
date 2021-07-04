import 'package:flutter/material.dart';
import 'package:calc_1/DarkCalculator.dart';
import 'package:calc_1/LightCalculator.dart';


class Navigation extends StatefulWidget {
  const Navigation({ Key? key }) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(length: 2, 
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        // backgroundColor: Colors.transparent,
          elevation: 7,
        // backgroundColor: Colors.blue.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(17)),
            ),
          title: Column(children: [
            Text("Calculator", 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 2,  
                letterSpacing: 1,     
              ),),
            Text("---------"),
          ],),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft
              )
            ),
          ),
          bottom: TabBar(
            labelColor: Color(0xff3d0040),
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            indicatorColor: Color(0xfffa820a),
            indicatorWeight: 5,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.2),
                insets: EdgeInsets.symmetric(horizontal: 45)
            ),
            tabs:[
              // Tab(child: Text("Light"),),
              Tab(icon: Icon(Icons.light_mode), text: 'Light',),
              Tab(icon: Icon(Icons.dark_mode), text: 'Dark',),
              // Tab(child: Text("Dark"),)
            ],
          ),
        ),
        body: TabBarView(children: [
          LightCalculator(),
          DarkCalculator(),
        ]),
      ),
      )
    );
  }
}

