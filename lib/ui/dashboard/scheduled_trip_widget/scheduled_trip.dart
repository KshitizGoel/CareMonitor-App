import 'package:flutter/material.dart';

class ScheduledTrip extends StatelessWidget {
  //This widget is supposed to populate the details from the API consisting of history of bookings!

  final IconData icon;
  final String locomotive;
  final Color color;

  ScheduledTrip(
      {required this.icon, required this.locomotive, required this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 15, right: 15),
        child: Container(
          width: 250,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey[400]!.withOpacity(0.70))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Container(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            icon,
                            color: color,
                          ),
                          Text(
                            locomotive,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "2 Seats",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
