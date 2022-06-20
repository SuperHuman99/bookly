import 'package:bookly/core/models/hotel_coordinates.dart';

class HotelLocation {
  HotelLocation({
    required this.coordinates,
    required this.resolvedLocation,
    required this.locationName,
  });

  final Coordinates coordinates;
  final String resolvedLocation;
  final String locationName;

  factory HotelLocation.fromJson(Map<String, dynamic> json) => HotelLocation(
        coordinates: Coordinates.fromJson(json["coordinates"]),
        resolvedLocation: json["resolvedLocation"],
        locationName: json["locationName"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates.toJson(),
        "resolvedLocation": resolvedLocation,
        "locationName": locationName,
      };
}
