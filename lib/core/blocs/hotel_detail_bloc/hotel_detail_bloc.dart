import 'package:bloc/bloc.dart';
import 'package:bookly/core/blocs/homepage_hotel_bloc/homepage_hotel_bloc.dart';
import 'package:bookly/core/models/hotel_detail_model.dart';
import 'package:bookly/core/models/room_image_item.dart';
import 'package:bookly/core/repositories/hotel_repository.dart';
import 'package:equatable/equatable.dart';

part 'hotel_detail_event.dart';
part 'hotel_detail_state.dart';

// Bloc responsible for fetching info and loading page for the detail of a selected hotel by the user
// Manages states and events triggered on the page ( HotelDetailScreen)

class HotelDetailBloc extends Bloc<HotelDetailEvent, HotelDetailState> {
  final HotelRepository hotelRepository = HotelRepository();

  final HomepageHotelBloc homepageHotelBloc = HomepageHotelBloc();

  HotelDetailBloc() : super(const HotelDetailLoading()) {
    on<LoadHotelDetailPage>(_onLoadPage);

    on<LoadHotelDetails>(_onLoadHotelDetails);

    on<LoadHotelDetailWithImages>(_onLoadHotelDetailsWithImages);
  }

  void _onLoadPage(LoadHotelDetailPage event, Emitter<HotelDetailState> emit) {
    emit(const HotelDetailLoading());
  }

  void _onLoadHotelDetails(
      LoadHotelDetails event, Emitter<HotelDetailState> emit) async {
    final state = this.state;

    if (state is HotelDetailLoading) {
      String today = DateTime.now().toString().substring(0, 10);
      String nextDay = DateTime.now()
          .add(const Duration(hours: 24))
          .toString()
          .substring(0, 10);
      var result = await hotelRepository.getHotelDetails(
          id: event.hotelId, checkIn: today, checkOut: nextDay);

      if (result is Hotel) {
        emit(HotelDetailLoaded(hotel: result));
        add(LoadHotelDetailWithImages(hotelId: event.hotelId));
      } else {
        emit(HotelDetailError(errorMessage: result.toString()));
      }
    }
  }

  void _onLoadHotelDetailsWithImages(
      LoadHotelDetailWithImages event, Emitter<HotelDetailState> emit) async {
    final state = this.state;

    if (state is HotelDetailLoaded) {
      var result = await hotelRepository.getHotelPhotos(hotelId: event.hotelId);

      if (result is RoomImageItem) {
        emit(
          HotelDetailLoadedComplete(roomImageItem: result, hotel: state.hotel),
        );
      } else {
        emit(
          HotelDetailLoadedComplete(hotel: state.hotel),
        );
      }
    }
  }
}
