import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/services/weather_service.dart';
import 'package:weather_application/widgets/display_weather.dart';

class SerachWeatherPage extends StatefulWidget {
  const SerachWeatherPage({super.key});

  @override
  State<SerachWeatherPage> createState() => _SerachWeatherPageState();
}

class _SerachWeatherPageState extends State<SerachWeatherPage> {
  final WeatherService _weatherService = WeatherService(
    apiKey: dotenv.env["OPRN_WEATHER_API_KEY"] ?? "",
  );
  Weather? _weather;
  String? _error;

  final TextEditingController _controller = TextEditingController();

  void _searchWeather() async {
    final city = _controller.text.trim();

    // if the value is empty
    if (city.isEmpty) {
      setState(() {
        _error = "Please enter the city";
      });

      return;
    }

    try {
      Weather weather = await _weatherService.getWeather(city);

      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (error) {
      setState(() {
        _error = "Could not find the weather data for $city";
      });
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Weather")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  label: Text("Search City"),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: _searchWeather,
                    icon: Icon(Icons.search),
                  ),
                ),
                onFieldSubmitted: (value) => _searchWeather(),
              ),

              SizedBox(height: 15),

              _error != null
                  ? Text(_error!, style: TextStyle(color: Colors.red))
                  : _weather != null
                  ? DisplayWeather(weather: _weather!)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
