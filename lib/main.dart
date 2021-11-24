import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project8/animations.dart';
import 'package:project8/consts.dart';
import 'package:project8/page/tab2.dart';

import 'component/side_tab_bar.dart';
import 'page/chart_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: backGroundColor,
      statusBarColor: backGroundColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, backgroundColor: backGroundColor),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int selectedIndex = 0;
  List<Widget> pages = const [
    ChartPage(),
    Tab2Page(),
    Center(
      child: Text('data'),
    ),
    Center(
      child: Text('data'),
    ),
    Center(
      child: Text('data'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: 
           SideTabBar(
              selectedIndex: selectedIndex,
              items: const [
                SideTabBarItem(
                  icon: Icons.bar_chart_rounded,
                  text: 'Trading',
                ),
                SideTabBarItem(
                  icon: Icons.attach_money_rounded,
                  text: 'Charts',
                ),
                SideTabBarItem(
                  icon: Icons.settings,
                  text: 'Null Tab',
                ),
                SideTabBarItem(
                  icon: Icons.settings,
                  text: 'Null Tab',
                ),
                SideTabBarItem(
                  icon: Icons.settings,
                  text: 'Null Tab',
                ),
              ],
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              screen: pages.elementAt(selectedIndex),
            ),
          ),
        
      
    );
  }
}
