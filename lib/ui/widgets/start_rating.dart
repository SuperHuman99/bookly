import 'package:bookly/ui/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    Key? key,
    required this.stars,
  }) : super(key: key);

  final double stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star_rate_rounded,
          color: index <= stars.round() ? appYellowColor : whiteColor,
        ),
      ),
    );
  }
}
