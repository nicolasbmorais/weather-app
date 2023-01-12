import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/time_forecast.dart';

class TimeForecastService {
  final String baseUrlAPI = 'dataservice.accuweather.com';
  final String path = 'forecasts/v1/hourly/12hour/${dotenv.env['CITY_CODE']}';
  final Map<String, String> params = {'apikey': '${dotenv.env['CITY_CODE']}', 'language': 'pt-BR', 'metric': 'true'};

  Future<List<TimeForecast>> retrieveLatestForecasts() async {
    final Response response = await get(Uri.https(baseUrlAPI, path, params));

    if (response.statusCode == 200) {
      Iterable iterable = jsonDecode(response.body);
      List<TimeForecast> forecast = List.from(
        iterable.map((objJson) => TimeForecast.fromMap(objJson)),
      );

      return forecast;
    } else {
      throw Exception('Falha ao carregar previsões');
    }
  }
}
