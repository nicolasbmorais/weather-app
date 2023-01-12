import 'package:flutter/material.dart';
import 'package:weather_app/models/time_forecast.dart';
import 'package:weather_app/services/time_forecast_services.dart';
import 'package:weather_app/widgets/next_temperatures.dart';
import 'package:weather_app/widgets/resume.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late Future<List<TimeForecast>> lastForecast;

  @override
  void initState() {
    super.initState();
    TimeForecastService service = TimeForecastService();
    lastForecast = service.retrieveLatestForecasts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vidente')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Resume(
                city: 'AA',
                description: 'description',
                currentTemperature: 29,
                maximumTemperature: 33,
                minimumTemperature: 28,
                iconNumber: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NextTemperatures(
                  forecast: lastForecast,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
