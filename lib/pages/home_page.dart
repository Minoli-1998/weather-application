import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/pages/serach_weather_page.dart';
import 'package:weather_application/providers/theme_provider.dart';
import 'package:weather_application/services/weather_service.dart';
import 'package:weather_application/widgets/display_weather.dart';

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
      final weather = await _weatherService.getWeather("Kurunegala");

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Easy Weather",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),

        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(
                context,
                listen: false,
              ).toggleTheme(Theme.of(context).brightness != Brightness.dark);
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),

      body: _weather != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DisplayWeather(weather: _weather!),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SerachWeatherPage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(107, 255, 208, 128),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Search Weather",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
