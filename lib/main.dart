import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/pages/home_page.dart';
import 'package:weather_application/providers/theme_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return ThemeProvider();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather Application",
      theme: Provider.of<ThemeProvider>(context).getThemeData,
      home: HomePage(),
    );
  }
}
