part of 'homepage_hotel_bloc.dart';

abstract class HomepageHotelState extends Equatable {
  const HomepageHotelState();

  @override
  List<Object> get props => [];
}

class HomepageHotelLoading extends HomepageHotelState {
  final List<HotelListItem> hotels;

  const HomepageHotelLoading({
    this.hotels = const <HotelListItem>[],
  });

  @override
  List<Object> get props => [hotels];
}

class HomepageHotelLoadError extends HomepageHotelState {
  final String errorMessage;

  const HomepageHotelLoadError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class HomepageHotelLoaded extends HomepageHotelState {
  final List<HotelListItem> hotels;

  const HomepageHotelLoaded({required this.hotels});

  @override
  List<Object> get props => [hotels];
}
