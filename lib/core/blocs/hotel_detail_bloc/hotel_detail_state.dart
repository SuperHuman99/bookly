part of 'hotel_detail_bloc.dart';

abstract class HotelDetailState extends Equatable {
  const HotelDetailState();

  @override
  List<Object> get props => [];
}

//state for when the details of the hotel to be viewed is being fetched
class HotelDetailLoading extends HotelDetailState {
  final Hotel? hotel;

  const HotelDetailLoading({this.hotel});

  @override
  List<Object> get props => [hotel!];
}

//state of the hotel detail when an error is encountered during fetching of the hotel details
class HotelDetailError extends HotelDetailState {
  final String errorMessage;

  const HotelDetailError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

//state for the details of the hotel to be viewed after scuccessful fetch of the data
class HotelDetailLoaded extends HotelDetailState {
  final Hotel? hotel;
  final RoomImageItem? roomImageItem;

  const HotelDetailLoaded({this.hotel, this.roomImageItem});

  @override
  List<Object> get props => [hotel!];
}

class HotelDetailLoadedComplete extends HotelDetailState {
  final RoomImageItem? roomImageItem;
  final Hotel? hotel;

  const HotelDetailLoadedComplete({this.hotel, this.roomImageItem});

  @override
  List<Object> get props => [];
}
