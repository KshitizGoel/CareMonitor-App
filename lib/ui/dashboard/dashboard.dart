import 'dart:async';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/ui/dashboard/dashboard_widget/widgets.dart';
import 'package:boilerplate/ui/empty_screen/empty.dart';
import 'package:boilerplate/ui/find_flights/find_flights.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int _numPages = 4;

  int _currentPage = 0;
  late Timer timerAnimation;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicatorAnimated() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              carouselImageWidget(),
              _pointsBarWidget(),
              _discountCircularWidget()
            ],
          ),
          _transportationWidget(),
          Container(
            height: 10,
            color: Colors.grey[100],
          ),
          _upcomingTripWidget(),
          _tripScheduleBar(),
          Container(
            height: 10,
            color: Colors.grey[100],
          ),
          _topRecommendationsWidget(),
          _destinationSlideBar(),
          Container(
            height: 10,
            color: Colors.grey[100],
          ),
        ],
      ),
    );
  }

  Widget carouselImageWidget() {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: 220,
                child: PageView(
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FindFlights();
                        }));
                      },
                      child: ClipRRect(
                        child: Image.asset(
                          Assets.travel_1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FindFlights();
                        }));
                      },
                      child: ClipRRect(
                        child: Image.asset(
                          Assets.travel_2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FindFlights();
                        }));
                      },
                      child: ClipRRect(
                        child: Image.asset(
                          Assets.travel_3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FindFlights();
                        }));
                      },
                      child: ClipRRect(
                        child: Image.asset(
                          Assets.travel_4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicatorAnimated(),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.bounceInOut,
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  Widget _pointsBarWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 20),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.monetization_on,
                size: 15,
                color: Colors.yellow[800]!.withOpacity(0.6),
              ),
              Text(
                "400 Points",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.yellow[900]!.withOpacity(0.6),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _discountCircularWidget() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, top: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.verified,
              color: Colors.blue.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget _transportationWidget() {
    return Container(
      height: 170,
      child: Column(
        children: [
          _covidTab(),
          _locomotiveBar(),
        ],
      ),
    );
  }

  Widget _covidTab() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow[700]!.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.yellow[900],
              ),
              Text(
                Strings.covidText,
                style: TextStyle(color: Colors.yellow[900]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _locomotiveBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: LocomotiveWidget(
                icon: Icons.airplanemode_on_rounded,
                colors: Colors.orange[800]!.withOpacity(0.70),
                type: "Plane"),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: LocomotiveWidget(
                icon: Icons.directions_railway_outlined,
                colors: Colors.yellow[800]!.withOpacity(0.70),
                type: "train"),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: LocomotiveWidget(
                icon: Icons.hotel,
                colors: Colors.blue[700]!.withOpacity(0.70),
                type: "Hotels"),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: LocomotiveWidget(
                icon: Icons.directions_bus,
                colors: Colors.green[700]!.withOpacity(0.70),
                type: "Bus"),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: LocomotiveWidget(
                icon: Icons.more,
                colors: Colors.blueGrey[700]!.withOpacity(0.70),
                type: "More"),
          ),
        ],
      ),
    );
  }

  Widget _upcomingTripWidget() {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20),
              child: Text(
                "Upcoming Trip",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text(
                "You have 2 upcoming tickets",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tripScheduleBar() {
    return Container(
      height: 120,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 25, right: 25),
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: Colors.grey[400]!.withOpacity(0.70))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topRecommendationsWidget() {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Text(
                "Top Destinations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Recommended place for you",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _destinationSlideBar() {
    return Container(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Assets.top_destinations,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Assets.top_destinations,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Assets.top_destinations,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return FindFlights();
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                Assets.top_destinations,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 10,
          ),
        ],
      ),
    );
  }
}
