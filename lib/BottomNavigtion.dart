import 'package:calc_1/DarkCalculator.dart';
import 'package:calc_1/LightCalculator.dart';
import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTab = 1;

  Widget currentScreen = LightCalculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(67.0), // here the desired height
              child: AppBar(
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
          title: Column(children: [
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text("Calculator", 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,     
                  ),),
              ),
              Text("---------"),
            ],),  
        ),
      ),
      // backgroundColor: Colors.white,
      body: PageStorage(bucket: PageStorageBucket(), child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        // notchMargin: 50,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft
              )
          ),
          padding: EdgeInsets.only(top: 2, bottom: 2),
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                  color: currentTab == 1 ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: MaterialButton(
                      minWidth: 50,
                      onPressed: () {
                        setState(() {
                          currentScreen = LightCalculator();
                          currentTab = 1;
                        });
                      },
                      child: Icon(Icons.light_mode,
                          color: currentTab == 1 ? Colors.yellowAccent : Colors.white)),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                  color: currentTab == 2 ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: MaterialButton(
                      minWidth: 60,
                      onPressed: () {
                        setState(() {
                          currentScreen = DarkCalculator();
                          currentTab = 2;
                        });
                      },
                      child: Icon(Icons.dark_mode,
                          color: currentTab == 2 ? Colors.black : Colors.white)),
                ),
              ]),
        ),
      ),
    );
  }
}