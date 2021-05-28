import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';

class JourneyDetails extends StatelessWidget {
  // Make a ListView.builder and then do the HTR magic

  final List? detailsList;

  JourneyDetails({
    required this.detailsList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detailsList!.length,
      itemBuilder: (BuildContext context, int index) {
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
                                  detailsList![index]["airlinesName"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    detailsList![index]["airlinesCode"],
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
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
                            detailsList![index]["transitTime"],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            "2 Transits >>",
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
                          detailsList![index]["departureTime"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            detailsList![index]["departureDate"],
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.flight_takeoff,
                      color: Colors.grey,
                      size: 25,
                    ),
                    Column(
                      children: [
                        Text(
                          detailsList![index]["landingTime"],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 22),
                        ),
                        Text(
                          detailsList![index]["landingDate"],
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20),
              child: Divider(
                thickness: 2,
                color: Colors.grey[200],
              ),
            )
          ],
        );
      },
    );
  }
}
