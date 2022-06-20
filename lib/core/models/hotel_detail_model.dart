// To parse required this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));

String hotelToJson(Hotel data) => json.encode(data.toJson());

class Hotel {
  Hotel({
    required this.pdpHeader,
    required this.overview,
    required this.propertyDescription,
    required this.guestReviews,
    required this.atAGlance,
    required this.amenities,
    required this.hygieneAndCleanliness,
    required this.unavailable,
  });

  final PdpHeader pdpHeader;
  final Overview overview;
  final PropertyDescription propertyDescription;
  final GuestReviews guestReviews;
  final AtAGlance atAGlance;
  final List<Amenity> amenities;
  final HygieneAndCleanliness? hygieneAndCleanliness;
  final Unavailable unavailable;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        pdpHeader: PdpHeader.fromJson(json["pdpHeader"]),
        overview: Overview.fromJson(json["overview"]),
        propertyDescription:
            PropertyDescription.fromJson(json["propertyDescription"]),
        guestReviews: GuestReviews.fromJson(json["guestReviews"]),
        atAGlance: AtAGlance.fromJson(json["atAGlance"]),
        amenities: List<Amenity>.from(
            json["amenities"].map((x) => Amenity.fromJson(x))),
        hygieneAndCleanliness:
            HygieneAndCleanliness.fromJson(json["hygieneAndCleanliness"] ?? {}),
        unavailable: Unavailable.fromJson(json["unavailable"]),
      );

  Map<String, dynamic> toJson() => {
        "pdpHeader": pdpHeader.toJson(),
        "overview": overview.toJson(),
        "propertyDescription": propertyDescription.toJson(),
        "guestReviews": guestReviews.toJson(),
        "atAGlance": atAGlance.toJson(),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "hygieneAndCleanliness": hygieneAndCleanliness!.toJson(),
        "unavailable": unavailable.toJson(),
      };
}

class Amenity {
  Amenity({
    required this.heading,
    required this.listItems,
  });

  final String heading;
  final List<ListItem> listItems;

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        heading: json["heading"],
        listItems: List<ListItem>.from(
            json["listItems"].map((x) => ListItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "listItems": List<dynamic>.from(listItems.map((x) => x.toJson())),
      };
}

class ListItem {
  ListItem({
    required this.heading,
    required this.listItems,
  });

  final String heading;
  final List<String> listItems;

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(
        heading: json["heading"],
        listItems: List<String>.from(json["listItems"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "listItems": List<dynamic>.from(listItems.map((x) => x)),
      };
}

class AtAGlance {
  AtAGlance({
    required this.keyFacts,
  });

  final KeyFacts keyFacts;

  factory AtAGlance.fromJson(Map<String, dynamic> json) => AtAGlance(
        keyFacts: KeyFacts.fromJson(json["keyFacts"]),
      );

  Map<String, dynamic> toJson() => {
        "keyFacts": keyFacts.toJson(),
      };
}

class KeyFacts {
  KeyFacts({
    required this.hotelSize,
    required this.arrivingLeaving,
    required this.specialCheckInInstructions,
    required this.requiredAtCheckIn,
  });

  final List<String> hotelSize;
  final List<String> arrivingLeaving;
  final List<String> specialCheckInInstructions;
  final List<String> requiredAtCheckIn;

  factory KeyFacts.fromJson(Map<String, dynamic> json) => KeyFacts(
        hotelSize: List<String>.from(json["hotelSize"].map((x) => x)),
        arrivingLeaving:
            List<String>.from(json["arrivingLeaving"].map((x) => x)),
        specialCheckInInstructions:
            List<String>.from(json["specialCheckInInstructions"].map((x) => x)),
        requiredAtCheckIn:
            List<String>.from(json["requiredAtCheckIn"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hotelSize": List<dynamic>.from(hotelSize.map((x) => x)),
        "arrivingLeaving": List<dynamic>.from(arrivingLeaving.map((x) => x)),
        "specialCheckInInstructions":
            List<dynamic>.from(specialCheckInInstructions.map((x) => x)),
        "requiredAtCheckIn":
            List<dynamic>.from(requiredAtCheckIn.map((x) => x)),
      };
}

class GuestReviews {
  GuestReviews({
    required this.brands,
  });

  final Brands brands;

  factory GuestReviews.fromJson(Map<String, dynamic> json) => GuestReviews(
        brands: Brands.fromJson(json["brands"]),
      );

  Map<String, dynamic> toJson() => {
        "brands": brands.toJson(),
      };
}

class Brands {
  Brands({
    required this.scale,
    required this.formattedScale,
    required this.rating,
    required this.formattedRating,
    required this.lowRating,
    required this.total,
  });

  final double scale;
  final String formattedScale;
  final double rating;
  final String formattedRating;
  final bool lowRating;
  final int total;

  factory Brands.fromJson(Map<String, dynamic> json) => Brands(
        scale: json["scale"],
        formattedScale: json["formattedScale"],
        rating: json["rating"].toDouble(),
        formattedRating: json["formattedRating"],
        lowRating: json["lowRating"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "scale": scale,
        "formattedScale": formattedScale,
        "rating": rating,
        "formattedRating": formattedRating,
        "lowRating": lowRating,
        "total": total,
      };
}

class HygieneAndCleanliness {
  HygieneAndCleanliness({
    required this.title,
    required this.healthAndSafetyMeasures,
  });

  final String title;
  final HealthAndSafetyMeasures healthAndSafetyMeasures;

  factory HygieneAndCleanliness.fromJson(Map<String, dynamic>? json) =>
      HygieneAndCleanliness(
        title: json!["title"] ?? "no title",
        healthAndSafetyMeasures: HealthAndSafetyMeasures.fromJson(
            json["healthAndSafetyMeasures"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "healthAndSafetyMeasures": healthAndSafetyMeasures.toJson(),
      };
}

class HealthAndSafetyMeasures {
  HealthAndSafetyMeasures({
    required this.title,
    required this.description,
    required this.measures,
  });

  final String title;
  final String description;
  final List<String> measures;

  factory HealthAndSafetyMeasures.fromJson(Map<String, dynamic> json) =>
      HealthAndSafetyMeasures(
        title: json["title"] ?? "no title",
        description: json["description"] ?? "no description",
        measures: List<String>.from(json["measures"]?.map((x) => x) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "measures": List<dynamic>.from(measures.map((x) => x)),
      };
}

class Overview {
  Overview({
    required this.overviewSections,
  });

  final List<OverviewSection> overviewSections;

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
        overviewSections: List<OverviewSection>.from(
            json["overviewSections"].map((x) => OverviewSection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "overviewSections":
            List<dynamic>.from(overviewSections.map((x) => x.toJson())),
      };
}

class OverviewSection {
  OverviewSection({
    required this.title,
    required this.type,
    required this.content,
    required this.contentType,
  });

  final String title;
  final String type;
  final List<String> content;
  final String contentType;

  factory OverviewSection.fromJson(Map<String, dynamic> json) =>
      OverviewSection(
        title: json["title"] ?? "Title",
        type: json["type"],
        content: List<String>.from(json["content"].map((x) => x)),
        contentType: json["contentType"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "type": type,
        "content": List<dynamic>.from(content.map((x) => x)),
        "contentType": contentType,
      };
}

class PdpHeader {
  PdpHeader({
    required this.hotelId,
    required this.destinationId,
    required this.currencyCode,
    required this.hotelLocation,
  });

  final String hotelId;
  final String destinationId;
  final String currencyCode;
  final HotelLocation hotelLocation;

  factory PdpHeader.fromJson(Map<String, dynamic> json) => PdpHeader(
        hotelId: json["hotelId"],
        destinationId: json["destinationId"],
        currencyCode: json["currencyCode"],
        hotelLocation: HotelLocation.fromJson(json["hotelLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "hotelId": hotelId,
        "destinationId": destinationId,
        "currencyCode": currencyCode,
        "hotelLocation": hotelLocation.toJson(),
      };
}

class HotelLocation {
  HotelLocation({
    required this.coordinates,
    required this.locationName,
  });

  final Coordinates coordinates;
  final String locationName;

  factory HotelLocation.fromJson(Map<String, dynamic> json) => HotelLocation(
        coordinates: Coordinates.fromJson(json["coordinates"]),
        locationName: json["locationName"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates.toJson(),
        "locationName": locationName,
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class PropertyDescription {
  PropertyDescription({
    required this.clientToken,
    required this.address,
    required this.priceMatchEnabled,
    required this.name,
    required this.starRatingTitle,
    required this.starRating,
    required this.featuredPrice,
    required this.mapWidget,
    required this.roomTypeNames,
  });

  final String clientToken;
  final Address address;
  final bool priceMatchEnabled;
  final String name;
  final String starRatingTitle;
  final double starRating;
  final FeaturedPrice featuredPrice;
  final MapWidget mapWidget;
  final List<String> roomTypeNames;

  factory PropertyDescription.fromJson(Map<String, dynamic> json) =>
      PropertyDescription(
        clientToken: json["clientToken"],
        address: Address.fromJson(json["address"]),
        priceMatchEnabled: json["priceMatchEnabled"],
        name: json["name"],
        starRatingTitle: json["starRatingTitle"],
        starRating: json["starRating"],
        featuredPrice: FeaturedPrice.fromJson(json["featuredPrice"]),
        mapWidget: MapWidget.fromJson(json["mapWidget"]),
        roomTypeNames: List<String>.from(json["roomTypeNames"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "clientToken": clientToken,
        "address": address.toJson(),
        "priceMatchEnabled": priceMatchEnabled,
        "name": name,
        "starRatingTitle": starRatingTitle,
        "starRating": starRating,
        "featuredPrice": featuredPrice.toJson(),
        "mapWidget": mapWidget.toJson(),
        "roomTypeNames": List<dynamic>.from(roomTypeNames.map((x) => x)),
      };
}

class Address {
  Address({
    required this.countryName,
    required this.cityName,
    required this.postalCode,
    required this.provinceName,
    required this.addressLine1,
    required this.countryCode,
    required this.pattern,
    required this.fullAddress,
  });

  final String countryName;
  final String cityName;
  final String postalCode;
  final String provinceName;
  final String addressLine1;
  final String countryCode;
  final String pattern;
  final String fullAddress;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        countryName: json["countryName"],
        cityName: json["cityName"],
        postalCode: json["postalCode"],
        provinceName: json["provinceName"],
        addressLine1: json["addressLine1"],
        countryCode: json["countryCode"],
        pattern: json["pattern"],
        fullAddress: json["fullAddress"],
      );

  Map<String, dynamic> toJson() => {
        "countryName": countryName,
        "cityName": cityName,
        "postalCode": postalCode,
        "provinceName": provinceName,
        "addressLine1": addressLine1,
        "countryCode": countryCode,
        "pattern": pattern,
        "fullAddress": fullAddress,
      };
}

class FeaturedPrice {
  FeaturedPrice({
    required this.currentPrice,
    required this.taxInclusiveFormatting,
    required this.bookNowButton,
  });

  final CurrentPrice currentPrice;
  final bool taxInclusiveFormatting;
  final bool bookNowButton;

  factory FeaturedPrice.fromJson(Map<String, dynamic> json) => FeaturedPrice(
        currentPrice: CurrentPrice.fromJson(json["currentPrice"]),
        taxInclusiveFormatting: json["taxInclusiveFormatting"],
        bookNowButton: json["bookNowButton"],
      );

  Map<String, dynamic> toJson() => {
        "currentPrice": currentPrice.toJson(),
        "taxInclusiveFormatting": taxInclusiveFormatting,
        "bookNowButton": bookNowButton,
      };
}

class CurrentPrice {
  CurrentPrice({
    required this.formatted,
    required this.plain,
  });

  final String formatted;
  final double plain;

  factory CurrentPrice.fromJson(Map<String, dynamic> json) => CurrentPrice(
        formatted: json["formatted"],
        plain: json["plain"],
      );

  Map<String, dynamic> toJson() => {
        "formatted": formatted,
        "plain": plain,
      };
}

class MapWidget {
  MapWidget({
    required this.staticMapUrl,
  });

  final String staticMapUrl;

  factory MapWidget.fromJson(Map<String, dynamic> json) => MapWidget(
        staticMapUrl: json["staticMapUrl"],
      );

  Map<String, dynamic> toJson() => {
        "staticMapUrl": staticMapUrl,
      };
}

class Unavailable {
  Unavailable();

  factory Unavailable.fromJson(Map<String, dynamic> json) => Unavailable();

  Map<String, dynamic> toJson() => {};
}
