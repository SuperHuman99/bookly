import 'package:bookly/core/blocs/homepage_hotel_bloc/homepage_hotel_bloc.dart';
import 'package:bookly/ui/constants/ui_constants.dart';
import 'package:bookly/ui/screens/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomepageHotelBloc()..add(const LoadHotels()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bookly',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: backgroundWhiteColor,
          fontFamily: GoogleFonts.nunito().fontFamily,
        ),
        home: const HomepageScreen(),
      ),
    );
  }
}
