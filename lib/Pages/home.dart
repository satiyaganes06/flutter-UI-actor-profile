import 'package:actors_profile_app/Pages/basic_sliver_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'advanced_sliverbar.dart';
import 'tabbar_sliver.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  final _drawerController = ZoomDrawerController();
  int _currentIndex = 0;

  final List _navi_List = [
    BasicSliverBar(),
    TabBarSliverAppbar(),
    AdvancedSliverAppbar(),
  ];

  _onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navi_List[_currentIndex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        enableFloatingNavBar:true,
        marginR : const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        items: [
          //Basic Sliver Bar
          DotNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            selectedColor: Colors.redAccent,
            unselectedColor: Colors.black,
          ),
          
          //Tabbar Sliver bar
          DotNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            selectedColor: Colors.redAccent,
            unselectedColor: Colors.black,
          ),

          //Advanced Sliver bar
          DotNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            selectedColor: Colors.redAccent,
            unselectedColor: Colors.black,
          ),
        ],

      ),
    );
  }
}