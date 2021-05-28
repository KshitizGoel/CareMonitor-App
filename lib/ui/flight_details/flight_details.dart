import 'package:boilerplate/stores/flight/flight_store.dart';
import 'package:boilerplate/ui/flight_details/details_widget/journey_details.dart';
import 'package:boilerplate/ui/flight_details/filter_widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class FlightDetails extends StatefulWidget {
  @override
  _FlightDetailsState createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  // late final Details flightDetails;

  late FlightStore _flightStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _flightStore = Provider.of<FlightStore>(context);
    _flightStore.getFlightDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _flightDetailWidget(),
          _filterContainer(),
          Container(
            height: 20,
            color: Colors.grey[100]!.withOpacity(0.70),
          ),
          Observer(builder: (context) {
            return _flightStore.flightDetails != null
                ? JourneyDetails(
                    detailsList: _flightStore.flightDetails,
                  )
                : Container(
                    height: 50, width: 10, child: CircularProgressIndicator());
          }),
        ],
      ),
    );
  }

  Widget _flightDetailWidget() {
    return Stack(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Colors.blue.withOpacity(0.70),
                Colors.blueAccent[700]!.withOpacity(0.70)
              ])),
        ),
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.blue[50]!.withOpacity(0.1)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        )),
                  ),
                  Column(
                    children: [
                      Text(
                        "Saturday",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 13),
                      ),
                      Text(
                        "May 28, 2021",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue[50]!.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "IGI",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      Text(
                        "New Delhi , India",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.blue[50]!.withOpacity(0.1)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.flight_takeoff,
                            color: Colors.white,
                            size: 25,
                          ),
                        )),
                  ),
                  Column(
                    children: [
                      Text(
                        "ZIA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      Text(
                        "Zurich, Switzerland",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _filterContainer() {
    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            FilterWidget(
              filterType: "Low price to High",
            ),
              VerticalDivider(
                thickness: 2,
                color: Colors.grey[100],
              ),
             FilterWidget(
              filterType: "Advanced Filter",
            ),
          ],
        ),
      ),
    );
  }
}
