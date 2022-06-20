import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/hotel_list_item_model.dart';
import 'package:bookly/core/repositories/hotel_repository.dart';
import 'package:equatable/equatable.dart';

part 'homepage_hotel_event.dart';
part 'homepage_hotel_state.dart';

// Bloc responsible for fetching info and loading page for list of hotels based on the selected country and city of user.
// Manages states and events triggered on the page ( HomepageScreen)

class HomepageHotelBloc extends Bloc<HomepageHotelEvent, HomepageHotelState> {
  final HotelRepository hotelRepository = HotelRepository();

  HomepageHotelBloc() : super(const HomepageHotelLoading()) {
    on<LoadHomepage>(_onLoadPage);

    on<LoadHotels>(_onLoadHotels);

    on<LoadMoreHotels>(_onLoadMoreHotels);
  }

  void _onLoadHotels(
      HomepageHotelEvent event, Emitter<HomepageHotelState> emit) async {
    final state = this.state;
    if (state is HomepageHotelLoading) {
      String today = DateTime.now().toString().substring(0, 10);

      var result = await hotelRepository.getHotelLists(
        checkIn: today,
        checkOut: today,
      );

      if (result is String) {
        emit(HomepageHotelLoadError(errorMessage: result));
      } else {
        List<HotelListItem> hotels = result;

        emit(HomepageHotelLoaded(hotels: hotels));
      }
    }
  }

  void _onLoadMoreHotels(
      HomepageHotelEvent event, Emitter<HomepageHotelState> emit) {}

  void _onLoadPage(HomepageHotelEvent event, Emitter<HomepageHotelState> emit) {
    emit(const HomepageHotelLoading());
  }
}
