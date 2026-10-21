import 'dart:convert';

import 'package:weather_application/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/services/get_location_service.dart';

class WeatherService {
  // https://api.openweathermap.org/data/2.5/weather?q=kurunegala&appid=340b6bdef521efed6ee725074e850a19&units=metric

  static const BASE_URL = "https://api.openweathermap.org/data/2.5/weather";

  final String apiKey;

  WeatherService({required this.apiKey});

  // method to get weather data using city name
  Future<Weather> getWeather(String cityName) async {
    try {
      final String url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (error) {
      throw Exception("Failed to load weather data");
    }
  }

  // get the weather from the current location
  Future<Weather> getWeatherByLocation() async {
    final location = GetLocationService();
    final cityName = await location.getCityNameByLocation();

    final String url = "$BASE_URL?q=$cityName&appid=$apiKey&units=metric";
    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (erro) {
      print(erro.toString());
      throw Exception("Failed to load data");
    }
  }
}
