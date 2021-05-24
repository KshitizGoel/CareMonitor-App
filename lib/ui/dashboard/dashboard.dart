import 'dart:async';

import 'package:boilerplate/constants/assets.dart';
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
      body: ListView(
        children: [
          Stack(
            children: [
              carouselImageWidget(),
              _pointsBarWidget()
            ],
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
                      onTap: () {},
                      child: ClipRRect(
                         child: Image.asset(
                          Assets.travel_1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                         child: Image.asset(
                          Assets.travel_2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                         child: Image.asset(
                          Assets.travel_3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
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
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white60,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  Widget _pointsBar(){
    return Container(
      color: Colors.white,

    )
  }

}
