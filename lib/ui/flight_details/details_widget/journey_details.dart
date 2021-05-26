import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';

class JourneyDetails extends StatelessWidget {
  final String airlinesName,
      airlinesCode,
      transitTime,
      departureTime,
      landingTime,
      departureDate,
      landingDate;

  JourneyDetails({
    required this.airlinesName,
    required this.airlinesCode,
    required this.transitTime,
    required this.departureTime,
    required this.landingTime,
    required this.departureDate,
    required this.landingDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            Assets.airlinesLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              airlinesName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                airlinesCode,
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        transitTime,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "2 Transit >>",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[600]!.withOpacity(0.70)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      departureTime,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        departureDate,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
                Icon(Icons.flight_takeoff , color: Colors.grey, size: 25,),
                Column(
                  children: [
                    Text(
                      landingTime,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                    Text(
                      landingDate,
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
          child: Divider(
            thickness: 2,
            color: Colors.grey[200],
          ),
        )
      ],
    );
  }
}
