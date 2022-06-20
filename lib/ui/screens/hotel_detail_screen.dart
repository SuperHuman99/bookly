import 'package:bookly/core/blocs/hotel_detail_bloc/hotel_detail_bloc.dart';
import 'package:bookly/core/models/hotel_detail_model.dart';
import 'package:bookly/core/models/room_image_item.dart';
import 'package:bookly/ui/screens/sub_screens/hotel_details_page.dart';
import 'package:bookly/ui/widgets/centered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({
    Key? key,
    required this.hotelId,
  }) : super(key: key);

  final String hotelId;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  void initState() {
    super.initState();

    context.read<HotelDetailBloc>().add(
          LoadHotelDetails(hotelId: widget.hotelId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HotelDetailBloc, HotelDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HotelDetailLoading) {
              return HotelDetailsScreenItems(hotelId: widget.hotelId);
            }

            if (state is HotelDetailError) {
              return const CenteredText(
                text:
                    "Sorry! We encountered an error while getting the details of the hotel",
              );
            }

            if (state is HotelDetailLoaded) {
              final Hotel? hotel = state.hotel;
              return HotelDetailsScreenItems(
                hotelId: widget.hotelId,
                hotel: hotel,
              );
            }

            if (state is HotelDetailLoadedComplete) {
              final RoomImageItem? roomImageItem = state.roomImageItem;
              return HotelDetailsScreenItems(
                hotelId: widget.hotelId,
                hotel: state.hotel,
                roomImageItem: roomImageItem,
              );
            }

            return const CenteredText(
              text: "Sorry! Something went wrong loading hotel details!",
            );
          },
        ),
      ),
    );
  }
}
