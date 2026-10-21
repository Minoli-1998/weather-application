import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService(
    apiKey: dotenv.env["OPRN_WEATHER_API_KEY"] ?? "",
  );

  Weather? _weather;

  void fetchWeather() async {
    try {
      final weather = await _weatherService.getWeatherByLocation();

      setState(() {
        _weather = weather;
      });
    } catch (error) {
      print("Error : $error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home Page")));
  }
}
