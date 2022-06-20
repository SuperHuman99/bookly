// To parse required this JSON data, do
//
//     final hotelListItem = hotelListItemFromJson(jsonString);

import 'dart:convert';

import 'package:bookly/ui/constants/ui_constants.dart';

HotelListItem hotelListItemFromJson(String str) =>
    HotelListItem.fromJson(json.decode(str));

String hotelListItemToJson(HotelListItem data) => json.encode(data.toJson());

class HotelListItem {
  HotelListItem({
    required this.id,
    required this.name,
    required this.starRating,
    required this.urls,
    required this.address,
    required this.guestReviews,
    required this.landmarks,
    required this.geoBullets,
    required this.ratePlan,
    required this.neighbourhood,
    required this.deals,
    required this.messaging,
    required this.badging,
    required this.pimmsAttributes,
    required this.coordinate,
    required this.providerType,
    required this.supplierHotelId,
    required this.isAlternative,
    required this.optimizedThumbUrls,
  });

  final int id;
  final String name;
  final double starRating;
  final Badging urls;
  final Address address;
  final GuestReviews guestReviews;
  final List<Landmark> landmarks;
  final List<dynamic> geoBullets;
  final RatePlan ratePlan;
  final String neighbourhood;
  final Badging deals;
  final Badging messaging;
  final Badging badging;
  final String pimmsAttributes;
  final Coordinate coordinate;
  final String providerType;
  final int supplierHotelId;
  final bool isAlternative;
  final OptimizedThumbUrls optimizedThumbUrls;

  factory HotelListItem.fromJson(Map<String, dynamic> json) => HotelListItem(
        id: json["id"],
        name: json["name"],
        starRating: json["starRating"],
        urls: Badging.fromJson(json["urls"]),
        address: Address.fromJson(json["address"]),
        guestReviews: GuestReviews.fromJson(json["guestReviews"]),
        landmarks: List<Landmark>.from(
            json["landmarks"].map((x) => Landmark.fromJson(x))),
        geoBullets: List<dynamic>.from(json["geoBullets"].map((x) => x)),
        ratePlan: RatePlan.fromJson(json["ratePlan"]),
        neighbourhood: json["neighbourhood"],
        deals: Badging.fromJson(json["deals"]),
        messaging: Badging.fromJson(json["messaging"]),
        badging: Badging.fromJson(json["badging"]),
        pimmsAttributes: json["pimmsAttributes"] ?? "Null",
        coordinate: Coordinate.fromJson(json["coordinate"]),
        providerType: json["providerType"],
        supplierHotelId: json["supplierHotelId"],
        isAlternative: json["isAlternative"],
        optimizedThumbUrls:
            OptimizedThumbUrls.fromJson(json["optimizedThumbUrls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "starRating": starRating,
        "urls": urls.toJson(),
        "address": address.toJson(),
        "guestReviews": guestReviews.toJson(),
        "landmarks": List<dynamic>.from(landmarks.map((x) => x.toJson())),
        "geoBullets": List<dynamic>.from(geoBullets.map((x) => x)),
        "ratePlan": ratePlan.toJson(),
        "neighbourhood": neighbourhood,
        "deals": deals.toJson(),
        "messaging": messaging.toJson(),
        "badging": badging.toJson(),
        "pimmsAttributes": pimmsAttributes,
        "coordinate": coordinate.toJson(),
        "providerType": providerType,
        "supplierHotelId": supplierHotelId,
        "isAlternative": isAlternative,
        "optimizedThumbUrls": optimizedThumbUrls.toJson(),
      };
}

class Address {
  Address({
    required this.streetAddress,
    required this.extendedAddress,
    required this.locality,
    required this.postalCode,
    required this.region,
    required this.countryName,
    required this.countryCode,
    required this.obfuscate,
  });

  final String streetAddress;
  final String extendedAddress;
  final String locality;
  final String postalCode;
  final String region;
  final String countryName;
  final String countryCode;
  final bool obfuscate;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetAddress: json["streetAddress"],
        extendedAddress: json["extendedAddress"],
        locality: json["locality"],
        postalCode: json["postalCode"],
        region: json["region"],
        countryName: json["countryName"],
        countryCode: json["countryCode"],
        obfuscate: json["obfuscate"],
      );

  Map<String, dynamic> toJson() => {
        "streetAddress": streetAddress,
        "extendedAddress": extendedAddress,
        "locality": locality,
        "postalCode": postalCode,
        "region": region,
        "countryName": countryName,
        "countryCode": countryCode,
        "obfuscate": obfuscate,
      };
}

class Badging {
  Badging();

  factory Badging.fromJson(Map<String, dynamic> json) => Badging();

  Map<String, dynamic> toJson() => {};
}

class Coordinate {
  Coordinate({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  factory Coordinate.fromJson(Map<String, dynamic> json) => Coordinate(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class GuestReviews {
  GuestReviews({
    required this.unformattedRating,
    required this.rating,
    required this.total,
    required this.scale,
  });

  final double unformattedRating;
  final String rating;
  final int total;
  final int scale;

  factory GuestReviews.fromJson(Map<String, dynamic> json) => GuestReviews(
        unformattedRating: json["unformattedRating"].toDouble(),
        rating: json["rating"],
        total: json["total"],
        scale: json["scale"],
      );

  Map<String, dynamic> toJson() => {
        "unformattedRating": unformattedRating,
        "rating": rating,
        "total": total,
        "scale": scale,
      };
}

class Landmark {
  Landmark({
    required this.label,
    required this.distance,
  });

  final String label;
  final String distance;

  factory Landmark.fromJson(Map<String, dynamic> json) => Landmark(
        label: json["label"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "distance": distance,
      };
}

class OptimizedThumbUrls {
  OptimizedThumbUrls({
    required this.srpDesktop,
  });

  final String srpDesktop;

  factory OptimizedThumbUrls.fromJson(Map<String, dynamic> json) =>
      OptimizedThumbUrls(
        srpDesktop: json["srpDesktop"] ?? noImageHotelAltUrl,
      );

  Map<String, dynamic> toJson() => {
        "srpDesktop": srpDesktop,
      };
}

class RatePlan {
  RatePlan({
    required this.price,
    required this.features,
  });

  final Price price;
  final Features features;

  factory RatePlan.fromJson(Map<String, dynamic> json) => RatePlan(
        price: Price.fromJson(json["price"]),
        features: Features.fromJson(json["features"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price.toJson(),
        "features": features.toJson(),
      };
}

class Features {
  Features({
    required this.paymentPreference,
    required this.noCcRequired,
  });

  final bool paymentPreference;
  final bool noCcRequired;

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        paymentPreference: json["paymentPreference"],
        noCcRequired: json["noCCRequired"],
      );

  Map<String, dynamic> toJson() => {
        "paymentPreference": paymentPreference,
        "noCCRequired": noCcRequired,
      };
}

class Price {
  Price({
    required this.current,
    required this.exactCurrent,
  });

  final String current;
  final double exactCurrent;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: json["current"],
        exactCurrent: json["exactCurrent"],
      );

  Map<String, dynamic> toJson() => {
        "current": current,
        "exactCurrent": exactCurrent,
      };
}
