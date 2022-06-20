part of 'hotel_detail_bloc.dart';

abstract class HotelDetailEvent extends Equatable {
  const HotelDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadHotelDetailPage extends HotelDetailEvent {
  final Hotel? hotel;

  const LoadHotelDetailPage({this.hotel});

  @override
  List<Object> get props => [hotel!];
}

class LoadHotelDetails extends HotelDetailEvent {
  final String hotelId;

  const LoadHotelDetails({required this.hotelId});

  @override
  List<Object> get props => [hotelId];
}

class LoadHotelDetailWithImages extends HotelDetailEvent {
  final String hotelId;

  const LoadHotelDetailWithImages({required this.hotelId});

  @override
  List<Object> get props => [hotelId];
}
