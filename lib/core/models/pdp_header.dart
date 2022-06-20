import 'package:bookly/core/models/hotel_location.dart';

class PdpHeader {
  PdpHeader({
    required this.hotelId,
    required this.destinationId,
    required this.pointOfSaleId,
    required this.currencyCode,
    required this.occupancyKey,
    required this.hotelLocation,
  });

  final String hotelId;
  final String destinationId;
  final String pointOfSaleId;
  final String currencyCode;
  final String occupancyKey;
  final HotelLocation hotelLocation;

  factory PdpHeader.fromJson(Map<String, dynamic> json) => PdpHeader(
        hotelId: json["hotelId"],
        destinationId: json["destinationId"],
        pointOfSaleId: json["pointOfSaleId"],
        currencyCode: json["currencyCode"],
        occupancyKey: json["occupancyKey"],
        hotelLocation: HotelLocation.fromJson(json["hotelLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "destinationId": destinationId,
        "pointOfSaleId": pointOfSaleId,
        "currencyCode": currencyCode,
        "occupancyKey": occupancyKey,
        "hotelLocation": hotelLocation.toJson(),
      };
}
