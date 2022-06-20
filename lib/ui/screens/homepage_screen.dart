import 'package:bookly/core/blocs/homepage_hotel_bloc/homepage_hotel_bloc.dart';
import 'package:bookly/core/blocs/hotel_detail_bloc/hotel_detail_bloc.dart';
import 'package:bookly/core/models/hotel_list_item_model.dart';
import 'package:bookly/ui/constants/ui_constants.dart';
import 'package:bookly/ui/screens/hotel_detail_screen.dart';
import 'package:bookly/ui/widgets/centered_text.dart';
import 'package:bookly/ui/widgets/custom_page_route.dart';
import 'package:bookly/ui/widgets/hotel_list_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  late TextEditingController searchBoxController;
  DateTime backPressedTime = DateTime.now();

  @override
  void initState() {
    searchBoxController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchBoxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(backPressedTime);
        final isExitWarning = difference >= const Duration(seconds: 2);

        backPressedTime = DateTime.now();

        if (isExitWarning) {
          FocusScope.of(context).unfocus();
          searchBoxController.clear();
          return false;
        } else {
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: backgroundWhiteColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu_rounded,
                  size: 32,
                  color: mainHintColor,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 32,
                    color: mainHintColor,
                  ),
                ),
                SizedBox(
                  width: 0.05 * screenWidth,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.tune_rounded,
                    size: 32,
                    color: mainHintColor,
                  ),
                ),
                SizedBox(
                  width: 0.05 * screenWidth,
                ),
              ],
              title: Text(
                "Bookly",
                style: TextStyle(
                    fontFamily: GoogleFonts.bungee().fontFamily,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              centerTitle: true,
              toolbarHeight: 80,
              elevation: 0,
            ),
            body: BlocBuilder<HomepageHotelBloc, HomepageHotelState>(
              builder: (context, state) {
                if (state is HomepageHotelLoading) {
                  return Center(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return HotelListItemCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          isLoading: true,
                          onTap: () {},
                        );
                      },
                    ),
                  );
                }

                if (state is HomepageHotelLoadError) {
                  return const Center(
                    child: Text(
                      "Sorry! there was an error loading available hotels",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  );
                }

                if (state is HomepageHotelLoaded) {
                  List<HotelListItem> hotels = state.hotels;
                  return Center(
                    child: ListView.builder(
                      itemCount: hotels.length,
                      itemBuilder: (context, index) {
                        HotelListItem hotel = hotels[index];
                        return HotelListItemCard(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          hotel: hotel,
                          onTap: () {
                            Navigator.of(context).push(
                              CustomPageRoute(
                                  child: BlocProvider(
                                create: (context) => HotelDetailBloc()
                                  ..add(const LoadHotelDetailPage()),
                                child: HotelDetailScreen(
                                  hotelId: hotel.id.toString(),
                                ),
                              )),
                            );
                          },
                        );
                      },
                    ),
                  );
                }

                return const CenteredText(
                    text:
                        "Sorry! Something went wrong loading available hotels");
              },
            )),
      ),
    );
  }
}
