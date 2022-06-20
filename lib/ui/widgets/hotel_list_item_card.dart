import 'package:bookly/core/models/hotel_list_item_model.dart';
import 'package:bookly/ui/constants/ui_constants.dart';
import 'package:bookly/ui/widgets/custom_shimmer.dart';
import 'package:bookly/ui/widgets/start_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HotelListItemCard extends StatefulWidget {
  const HotelListItemCard({
    Key? key,
    this.hotel,
    required this.screenHeight,
    required this.screenWidth,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  final HotelListItem? hotel;
  final double screenHeight;
  final double screenWidth;
  final Function onTap;
  final bool isLoading;

  @override
  State<HotelListItemCard> createState() => _HotelListItemCardState();
}

class _HotelListItemCardState extends State<HotelListItemCard> {
  @override
  Widget build(BuildContext context) {
    double contentHeight = widget.screenHeight * 0.30;
    double contentWidth = 0.95 * widget.screenWidth;

    double innerPadding = 15.0;
    double borederRadius = 15.0;
    double neumorphismOffset = 5.0;
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(-neumorphismOffset, -neumorphismOffset),
              color: whiteColor,
              blurRadius: 15.0,
            ),
            BoxShadow(
              offset: Offset(neumorphismOffset, neumorphismOffset),
              color: neumorphicShaddowColor,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borederRadius),
          ),
          color: backgroundWhiteColor,
          shadowColor: neumorphicShaddowColor,
          child: Padding(
            padding: EdgeInsets.all(innerPadding),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borederRadius),
              ),
              height: contentHeight,
              width: contentWidth,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: contentHeight,
                      width: contentWidth,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(borederRadius),
                          child: widget.isLoading
                              ? CustomShimmer(
                                  width: contentWidth,
                                  height: contentHeight,
                                  borderRadius: borederRadius,
                                )
                              : CachedNetworkImage(
                                  imageUrl: widget
                                      .hotel!.optimizedThumbUrls.srpDesktop,
                                  fit: BoxFit.cover,
                                  width: contentWidth,
                                  height: contentHeight,
                                )),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: contentWidth,
                      height: contentHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(innerPadding),
                        gradient: widget.isLoading
                            ? null
                            : LinearGradient(
                                colors: [
                                  neumorphicShaddowColor.withOpacity(0.02),
                                  textColor
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(innerPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.isLoading
                                      ? CustomShimmer(
                                          width: 0.6 * contentWidth,
                                          height: 20,
                                          borderRadius: 1)
                                      : Text(
                                          widget.hotel!.name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: whiteColor,
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 40,
                                    child: widget.isLoading
                                        ? CustomShimmer(
                                            width: 0.4 * contentWidth,
                                            height: 40,
                                            borderRadius: 1)
                                        : StarRating(
                                            stars: widget.hotel!.starRating,
                                          ),
                                  ),
                                  widget.isLoading
                                      ? CustomShimmer(
                                          width: 0.8 * contentWidth,
                                          height: 20,
                                          borderRadius: 1)
                                      : Text(
                                          "${widget.hotel!.address.streetAddress}, ${widget.hotel!.address.locality}, ${widget.hotel!.address.countryName},",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: whiteColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.05 * contentHeight,
                    right: 0.03 * contentWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: widget.isLoading
                          ? const CustomShimmer(
                              width: 20,
                              height: 20,
                              borderRadius: 5,
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: whiteColor,
                                size: 32,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
