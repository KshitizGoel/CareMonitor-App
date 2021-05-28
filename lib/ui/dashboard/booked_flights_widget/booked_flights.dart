import 'package:boilerplate/ui/find_flights/find_flights.dart';
import 'package:flutter/material.dart';

class BookedFlights extends StatelessWidget {
  final List? bookingsList;

  BookedFlights({
    required this.bookingsList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: bookingsList!.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return FindFlights();
            }));
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 15, right: 15),
              child: Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey[400]!)),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                      child: Container(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.flight_takeoff,
                                  color:
                                      Colors.blueAccent[700]!.withOpacity(0.70),
                                ),
                                Text(
                                  bookingsList![index]["locomotiveType"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent[700]!
                                        .withOpacity(0.70),
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
                                    color: Colors.tealAccent[700]!
                                        .withOpacity(0.70),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 8.0  ),
                              child: Text(
                                  bookingsList![index]["departureLocation"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( bottom: 8, left: 5 , right: 5),
                              child: Text(
                                bookingsList![index]["departureTime"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal : 5.0),
                              child: Text(
                                bookingsList![index]["dateOfArrival"],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward , color: Colors.teal.withOpacity(0.90),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical : 8.0  ),
                              child: Text(
                                bookingsList![index]["destinationLocation"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( bottom: 8, left: 5 , right: 5),
                              child: Text(
                                bookingsList![index]["destinationTime"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal : 5.0),
                              child: Text(
                                bookingsList![index]["dateOfReaching"],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
