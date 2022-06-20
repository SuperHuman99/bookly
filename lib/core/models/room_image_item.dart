// To parse required this JSON data, do
//
//     final roomImageItem = roomImageItemFromJson(jsonString);

import 'dart:convert';

RoomImageItem roomImageItemFromJson(String str) =>
    RoomImageItem.fromJson(json.decode(str));

String roomImageItemToJson(RoomImageItem data) => json.encode(data.toJson());

class RoomImageItem {
  RoomImageItem({
    required this.roomId,
    required this.images,
  });

  final int roomId;
  final List<Image> images;

  factory RoomImageItem.fromJson(Map<String, dynamic> json) => RoomImageItem(
        roomId: json["roomId"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "roomId": roomId,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  Image({
    required this.baseUrl,
    required this.imageId,
    required this.mediaGuid,
    required this.sizes,
  });

  final String baseUrl;
  final int imageId;
  final String mediaGuid;
  final List<Size> sizes;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        baseUrl: json["baseUrl"],
        imageId: json["imageId"],
        mediaGuid: json["mediaGUID"],
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "baseUrl": baseUrl,
        "imageId": imageId,
        "mediaGUID": mediaGuid,
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
      };
}

class Size {
  Size({
    required this.type,
    required this.suffix,
  });

  final int type;
  final String suffix;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        type: json["type"],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "suffix": suffix,
      };
}
