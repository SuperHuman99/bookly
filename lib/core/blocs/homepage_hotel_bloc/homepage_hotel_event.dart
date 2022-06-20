part of 'homepage_hotel_bloc.dart';

abstract class HomepageHotelEvent extends Equatable {
  const HomepageHotelEvent();

  @override
  List<Object> get props => [];
}

class LoadHomepage extends HomepageHotelEvent {
  const LoadHomepage({this.news = const <HotelListItem>[]});

  final List<HotelListItem> news;

  @override
  List<Object> get props => [news];
}

class LoadHotels extends HomepageHotelEvent {
  const LoadHotels({this.news = const <HotelListItem>[]});

  final List<HotelListItem> news;

  @override
  List<Object> get props => [news];
}

class LoadMoreHotels extends HomepageHotelEvent {
  const LoadMoreHotels(
      {this.hotels = const <HotelListItem>[], required this.page});

  final List<HotelListItem> hotels;
  final int page;

  @override
  List<Object> get props => [hotels, page];
}
