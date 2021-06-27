import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget/views/daily.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        child: Icon(Icons.add, size: 25),
        backgroundColor: Color(0xFF4C5D70),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        Daily(),
        Center(
          child: Text("Stats Page"),
        ),
        Center(
          child: Text("Create budget Page"),
        ),
        Center(
          child: Text("Budget Page"),
        ),
        Center(
          child: Text("Profile Page"),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.calendar_today,
      Icons.query_stats_sharp,
      Icons.wallet_membership,
      Icons.person,
    ];

    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: Color(0xFF4C5D70),
        inactiveColor: Colors.grey,
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
