import 'package:boilerplate/ui/dashboard/dashboard.dart';
import 'package:boilerplate/ui/empty_screen/empty.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Landing extends StatefulWidget {
  var _indexPassed;

  Landing(this._indexPassed);

  @override
  _LandingState createState() => _LandingState(_indexPassed);
}

class _LandingState extends State<Landing> {
  var _indexPassed;

  _LandingState(this._indexPassed);

  var _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = _indexPassed;
  }

  final List<Widget> _children = [
    Dashboard(),
    EmptyPage(),
    EmptyPage(),
    EmptyPage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.indigo[700]!.withOpacity(0.75),
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            activeIcon:
                Icon(Icons.home, color: Colors.indigo[700]!.withOpacity(0.75)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined, color: Colors.grey),
            title: Text(
              "Tickets",
              style: TextStyle(
                  color: Colors.indigo[700]!.withOpacity(0.75),
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.local_offer_outlined,
                color: Colors.indigo[700]!.withOpacity(0.75)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey),
            title: Text(
              "Notifications",
              style: TextStyle(
                  color: Colors.indigo[700]!.withOpacity(0.75),
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.notifications,
                color: Colors.indigo[700]!.withOpacity(0.75)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.grey),
              title: Text(
                "Settings",
                style: TextStyle(
                    color: Colors.indigo[700]!.withOpacity(0.75),
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              activeIcon: Icon(Icons.settings,
                  color: Colors.indigo[700]!.withOpacity(0.75))),
        ],
        onTap: onTappedBar,
      ),
    );
  }
}
