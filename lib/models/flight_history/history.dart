class History {
  final String? locomotiveType,
      departureTime,
      departureLocation,
      destinationTime,
      destinationLocation,
      dateOfArrival,
      dateOfReaching;

  History({
    required this.dateOfArrival,
    required this.dateOfReaching,
    required this.departureLocation,
    required this.departureTime,
    required this.destinationLocation,
    required this.destinationTime,
    required this.locomotiveType,
  });

  factory History.fromMap(Map<String, dynamic> json) => History(
        dateOfArrival: json["dateOfArrival"],
        dateOfReaching: json["dateOfReaching"],
        departureLocation: json["departureLocation"],
        departureTime: json["departureTime"],
        destinationLocation: json["destinationLocation"],
        destinationTime: json["destinationTime"],
        locomotiveType: json["locomotiveType"],
      );

  Map<String, dynamic> toMap() => {
        "dateOfArrival": dateOfArrival,
        "dateOfReaching": dateOfReaching,
        "departureLocation": departureLocation,
        "departureTime": departureTime,
        "destinationLocation": destinationLocation,
        "destinationTime": destinationTime,
        "locomotiveType": locomotiveType,
      };
}
