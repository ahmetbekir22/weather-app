import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/pages/widgets_page.dart';

class HomePage extends StatefulWidget {
  final String city;
  const HomePage({super.key, required this.city});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherFactory _weatherFactory = WeatherFactory(weather_api_key);
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    getCityWeather(widget.city);
  }

  void getCityWeather(String city) {
    _weatherFactory.currentWeatherByCityName(city).then((weather) {
      setState(() {
        _weather = weather;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsPage widgetsPage = WidgetsPage(_weather);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 157, 131, 200),
      ),
      body: SingleChildScrollView(child: _buildUI(widgetsPage)),
    );
  }

  Widget _buildUI(WidgetsPage widgetsPage) {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        widgetsPage.dateTimeInfo(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        widgetsPage.locationHeader(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        widgetsPage.weatherIcon(context),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        widgetsPage.currentTemperature(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        widgetsPage.moreInfo(context),
      ],
    );
  }
}
