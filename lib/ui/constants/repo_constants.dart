const getHoteDetailsBaseUrl =
    "https://hotels4.p.rapidapi.com/properties/get-details?";

const hotelListBaseUrl = "https://hotels4.p.rapidapi.com/properties/list?";

const hotelDetailBaseUrl =
    "https://hotels4.p.rapidapi.com/properties/get-details?";

const hotelPhotosBaseUrl =
    "https://hotels4.p.rapidapi.com/properties/get-hotel-photos";

const apiKey = "";

const apiHost = "hotels4.p.rapidapi.com";

Map<String, String> headers = {
  'X-RapidAPI-Key': apiKey,
  'X-RapidAPI-Host': apiHost,
};

String converBaseImageUrlToImageUrl({required String baseUrl}) {
  int length = baseUrl.length;

  String completeUrl = "${baseUrl.substring(0, length - 10)}z.jpg";

  return completeUrl;
}
