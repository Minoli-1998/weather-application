import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/util_functions.dart';

class DisplayWeather extends StatelessWidget {
  final Weather weather;
  const DisplayWeather({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.75;

    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Lottie.asset(
                Utils().getWeatherAnimation(condition: weather.condition),
                width: width,
                height: width,
              ),
            ),

            Text(
              weather.cityName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),

            SizedBox(height: 10),

            // temperature
            Text(
              "${weather.temperature.toStringAsFixed(1)}C",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),

            Row(
              children: [
                Text(
                  weather.condition,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  weather.description,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWeatherDetails("Pressure", "${weather.pressure} hPa"),

                _buildWeatherDetails("Humidity", "${weather.humidity} %"),

                _buildWeatherDetails("Wind Speed", "${weather.windSpeed} m/s"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetails(String lable, String value) {
    return Column(
      children: [
        Text(lable, style: TextStyle(fontWeight: FontWeight.bold)),

        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey),
        ),
      ],
    );
  }
}
