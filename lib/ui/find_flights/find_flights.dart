import 'package:flutter/material.dart';

class FindFlights extends StatefulWidget {
  @override
  _FindFlightsState createState() => _FindFlightsState();
}

class _FindFlightsState extends State<FindFlights> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
