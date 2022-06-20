import 'package:bookly/core/models/hotel_detail_model.dart';
import 'package:bookly/core/models/room_image_item.dart';
import 'package:bookly/ui/constants/repo_constants.dart';
import 'package:bookly/ui/constants/ui_constants.dart';
import 'package:bookly/ui/widgets/custom_shimmer.dart';
import 'package:bookly/ui/widgets/start_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HotelDetailsScreenItems extends StatefulWidget {
  const HotelDetailsScreenItems(
      {Key? key, required this.hotelId, this.hotel, this.roomImageItem})
      : super(key: key);

  final String hotelId;
  final Hotel? hotel;
  final RoomImageItem? roomImageItem;

  @override
  State<HotelDetailsScreenItems> createState() =>
      _HotelDetailsScreenItemsState();
}

class _HotelDetailsScreenItemsState extends State<HotelDetailsScreenItems> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double contentWidth = 0.95 * screenWidth;
    double imageContainerHeight = 0.45 * screenHeight;
    double imageContainerRadius = 0.1 * contentWidth;
    double neumorphicOffset = 5.0;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 0.02 * screenHeight),
              height: imageContainerHeight,
              width: contentWidth,
              decoration: BoxDecoration(
                color: backgroundWhiteColor,
                borderRadius: BorderRadius.circular(imageContainerRadius),
                boxShadow: [
                  BoxShadow(
                    color: whiteColor,
                    offset: Offset(-neumorphicOffset, -neumorphicOffset),
                    blurRadius: 10,
                    spreadRadius: 0.0,
                  ),
                  BoxShadow(
                    color: neumorphicShaddowColor,
                    offset: Offset(neumorphicOffset, neumorphicOffset),
                    blurRadius: 10,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: 0.95 * contentWidth,
                  height: 0.95 * imageContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(imageContainerRadius),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(imageContainerRadius),
                    child: widget.hotel == null || widget.roomImageItem == null
                        ? CustomShimmer(
                            width: contentWidth,
                            height: imageContainerHeight,
                            borderRadius: imageContainerRadius,
                          )
                        : CarouselSlider(
                            options: CarouselOptions(
                                height: imageContainerHeight,
                                viewportFraction: 1.0),
                            items: widget.roomImageItem!.images.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return CachedNetworkImage(
                                    imageUrl: converBaseImageUrlToImageUrl(
                                      baseUrl: image.baseUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  );
                                },
                              );
                            }).toList(),
                          ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 0.03 * screenHeight,
              width: contentWidth,
              //decoration: testBorder,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0.7 * contentWidth,
                    child: widget.hotel == null
                        ? CustomShimmer(
                            width: 0.65 * contentWidth,
                            height: 0.03 * screenHeight,
                            borderRadius: 0,
                          )
                        : Text(
                            widget.hotel!.propertyDescription.name,
                            style: textDisplayLarge,
                          ),
                  ),
                  widget.hotel == null
                      ? CustomShimmer(
                          width: 0.2 * contentWidth,
                          height: 0.03 * screenHeight,
                          borderRadius: 0,
                        )
                      : StarRating(
                          stars: widget.hotel!.propertyDescription.starRating,
                        ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 0.03 * screenHeight,
              width: contentWidth,
              //decoration: testBorder,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0.65 * contentWidth,
                    child: widget.hotel == null
                        ? CustomShimmer(
                            width: 0.6 * contentWidth,
                            height: 0.03 * screenHeight,
                            borderRadius: 0,
                          )
                        : Text(
                            "${widget.hotel!.propertyDescription.address.addressLine1}, ${widget.hotel!.propertyDescription.address.cityName}, ${widget.hotel!.propertyDescription.address.countryName}",
                            style: textDisplayMedium,
                          ),
                  ),
                  widget.hotel == null
                      ? CustomShimmer(
                          width: 0.2 * contentWidth,
                          height: 0.03 * screenHeight,
                          borderRadius: 0,
                        )
                      : Text(
                          widget.hotel!.propertyDescription.featuredPrice
                              .currentPrice.formatted,
                          style: textDisplayMediumPrimary,
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            widget.hotel == null
                ? buildHotelAmenitiesInfoLoading(contentWidth: contentWidth)
                : buildHotelAmenitiesInfo(
                    amenities: widget.hotel!.amenities,
                    contentWidth: contentWidth,
                  ),
            Text(
              "At A Glance".toUpperCase(),
              style: textDisplayExtraLargePrimary,
            ),
            const SizedBox(
              height: 10,
            ),
            widget.hotel == null
                ? buildHotelAtAGlanceInfoLoading(contentWidth: contentWidth)
                : buildHotelAtAGlanceInfo(
                    atAGlance: widget.hotel!.atAGlance,
                    contentWidth: contentWidth),
          ],
        ),
      ),
    );
  }

  Widget buildHotelAtAGlanceInfo(
      {required AtAGlance atAGlance, required double contentWidth}) {
    return SizedBox(
      width: contentWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpansionTile(
            title: Text(
              "Hotel Size",
              style: textDisplayMediumPrimary,
            ),
            children: turnListToSubItemsWidget(
                    items: atAGlance.keyFacts.hotelSize,
                    contentWidth: contentWidth)
                .toList(),
          ),
          ExpansionTile(
            title: Text(
              "Arriving and Leaving",
              style: textDisplayMediumPrimary,
            ),
            children: turnListToSubItemsWidget(
                    items: atAGlance.keyFacts.arrivingLeaving,
                    contentWidth: contentWidth)
                .toList(),
          ),
          ExpansionTile(
            title: Text(
              "Special Check In Instructions",
              style: textDisplayMediumPrimary,
            ),
            children: turnListToSubItemsWidget(
                    items: atAGlance.keyFacts.specialCheckInInstructions,
                    contentWidth: contentWidth)
                .toList(),
          ),
          ExpansionTile(
            title: Text(
              "Required At Check In",
              style: textDisplayMediumPrimary,
            ),
            children: turnListToSubItemsWidget(
                    items: atAGlance.keyFacts.requiredAtCheckIn,
                    contentWidth: contentWidth)
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildHotelAmenitiesInfoLoading({required double contentWidth}) {
    return Column(
      children: [
        CustomShimmer(width: contentWidth, height: 30, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 50, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 30, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 50, borderRadius: 0),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildHotelAtAGlanceInfoLoading({required double contentWidth}) {
    return Column(
      children: [
        CustomShimmer(width: contentWidth, height: 50, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 20, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 20, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 20, borderRadius: 0),
        const SizedBox(height: 10),
        CustomShimmer(width: contentWidth, height: 20, borderRadius: 0),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildHotelAmenitiesInfo(
      {required List<Amenity> amenities, required double contentWidth}) {
    return SizedBox(
      width: contentWidth,
      child: Column(
        children: amenities
            .map(
              (e) => Container(
                width: contentWidth,
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.heading.toUpperCase(),
                      style: textDisplayExtraLargePrimary,
                    ),
                    const SizedBox(height: 10),
                    ExpansionTile(
                      title: Text(
                        e.listItems.first.heading,
                        style: textDisplayMediumPrimary,
                      ),
                      children: [
                        ...e.listItems.first.listItems.map(
                          (e) => Padding(
                            padding: EdgeInsets.only(
                                left: 0.1 * contentWidth, bottom: 5),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.info_outline_rounded,
                                  color: mainHintColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  e,
                                  style: textDisplayMedium,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Iterable<Padding> turnListToSubItemsWidget(
      {required List items, required double contentWidth}) {
    return items.map(
      (e) => Padding(
        padding: EdgeInsets.only(left: 0.1 * contentWidth, bottom: 5.0),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: mainHintColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                e,
                style: textDisplayMedium,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
