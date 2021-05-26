import 'package:boilerplate/ui/flight_details/flight_details.dart';
import 'package:boilerplate/ui/tab_bar/tab_bar_page.dart';
import 'package:flutter/material.dart';

class FindFlights extends StatefulWidget {
  @override
  _FindFlightsState createState() => _FindFlightsState();
}

class _FindFlightsState extends State<FindFlights> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              _customTextContainer(),
              Container(
                height: 30,
              ),
              _tabBar(),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter, child: _bottomButton(_width)),
        ],
      ),
    );
  }

  Widget _customTextContainer() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 20),
            child: Row(
              children: [
                Text(
                  "Find",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.black),
                ),
                Text(
                  " Flights ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.yellow[700]!.withOpacity(0.79)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Explore Paradise",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton(double _width) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FlightDetails();
        }));
      },
      child: Container(
        width: _width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.70),
        ),
        child: Center(
          child: Text(
            "Search Flight",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return DefaultTabController(
        length: 2, // length of tabs
        initialIndex: 1,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
          Container(
            child: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              indicatorWeight: 3,
              indicatorColor: Colors.green[300]!.withOpacity(0.70),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'One Way'),
                Tab(text: 'Round Trip'),
              ],
            ),
          ),
          Container(
              height: 500, //height of TabBarView
              child: TabBarView(children: <Widget>[TabBarPage(), TabBarPage()]))
        ]));
  }
}
