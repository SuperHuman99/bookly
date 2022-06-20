import 'dart:convert';
import 'dart:io';

import 'package:bookly/core/models/hotel_detail_model.dart';
import 'package:bookly/core/models/hotel_list_item_model.dart';
import 'package:bookly/core/models/room_image_item.dart';
import 'package:bookly/ui/constants/repo_constants.dart';
import 'package:http/http.dart' as http;

//This class is responsible for commuinicating with APIs and fetching all data relating to hotels
//The function calls to be made by this class include:
//== Fetching from the API the list all available hotels based on the residence of the user
//== Fetching the details of a particular hotel by Id onclick of any of the hotel in a list of hotels
//== Fetching list of locations where hotels can be found in a particular city

class HotelRepository {
  //Makes the API call to get the list of available hotels based on the ID of a particular location
  Future getHotelLists({
    String destinationId = "1506246",
    String pageSize = "20",
    String pageNumber = "1",
    String adults = "1",
    required String checkIn,
    required String checkOut,
  }) async {
    final url = Uri.parse(
      "$hotelListBaseUrl&destinationId=$destinationId&pageNumber=$pageNumber&pageSize=$pageSize&checkIn=$checkIn&checkOut=$checkOut&adults1=$adults",
    );

    try {
      final response = await http.get(url, headers: headers);

      var root = jsonDecode(response.body);

      var result = root["data"]["body"]["searchResults"]["results"] as List;

      List<HotelListItem> hotels = [];

      for (var item in result) {
        HotelListItem hotel = HotelListItem.fromJson(item);
        hotels.add(hotel);
      }

      return hotels;
    } on SocketException {
      return "Ooops, couldn't establish a connection with hotel server!";
    } catch (e) {
      return "Sorry, something went wrong fetching the list of available hotels in your city!";
    }
  }

  // Responsible for getting the details of a particular hotel by Id.
  //Will be used or called when a user clicks on a hotel in a list
  Future getHotelDetails({
    required String id,
    required String checkIn,
    required String checkOut,
  }) async {
    try {
      final url = Uri.parse(
        "$hotelDetailBaseUrl&id=$id&checkIn=$checkIn&checkOut=$checkOut",
      );

      final response = await http.get(url, headers: headers);

      var root = jsonDecode(response.body);

      var result = root["data"]["body"] as Map<String, dynamic>;

      Hotel hotel = Hotel.fromJson(result);

      return hotel;
    } on SocketException {
      return "Ooops ! There was a network problem fetching the hotel info";
    } catch (e) {
      return e.toString();
    }
  }

  Future getHotelPhotos({required String hotelId}) async {
    try {
      final url = Uri.parse("$hotelPhotosBaseUrl?id=$hotelId");

      final response = await http.get(url, headers: headers);

      var root = jsonDecode(response.body);

      var result = (root["roomImages"] as List).first;

      RoomImageItem roomImageItem = RoomImageItem.fromJson(result);

      return roomImageItem;
    } on SocketException {
      return "Aw, Sorry! Couldnt get images of this hotel!";
    } catch (e) {
      return e.toString();
    }
  }
}
