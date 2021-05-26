import 'package:boilerplate/ui/tab_bar/destination_widget/destination_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'class_widget/ClassWidget.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ))!;
    if (picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 10,
              color: Colors.grey[50]!,
            ),
            DestinationWidget(
                icon: Icons.flight_takeoff,
                text: "From",
                airportName: "IGI Airport New Delhi",
                location: "New Delhi , India"),
            DestinationWidget(
                icon: Icons.flight_land_outlined,
                text: "To",
                airportName: "Zurich International Airport",
                location: "Zurich , Switzerland"),
            Container(
              height: 10,
              color: Colors.grey[50]!,
            ),
            _scheduleWidget(_width),
            Container(
              height: 10,
              color: Colors.grey[50]!,
            ),
            _classSelectionWidget(),

          ],
        ),
      ),
    );
  }

  Widget _scheduleWidget(double _width) {
    return Container(
      height: 130,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            _departureDateWidget(_width),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: VerticalDivider(
                thickness: 2,
                color: Colors.grey[100],
              ),
            ),
            _returnDateWidget(_width)
          ],
        ),
      ),
    );
  }

  Widget _departureDateWidget(double _width) {
    return Container(
      width: _width / 2.43,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Departure",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey[200]),
                child: IconButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.grey[700],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _returnDateWidget(double _width) {
    return Container(
      width: _width / 2.43,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Return",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.grey[200]),
                child: IconButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.grey[700],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _classSelectionWidget(){
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.all(20),
              child: Text(
                "Class",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClassWidget(className: 'Economy',),
              ClassWidget(className: 'Business',),
              ClassWidget(className: 'VVIP',),
            ],
          )
        ],
      ),
    );
  }
}
