import 'package:flutter/material.dart';
import 'package:weather_app/models/time_forecast.dart';

class NextTemperatures extends StatelessWidget {
  final List<TimeForecast> forecast;
  const NextTemperatures({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecast.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return Card(
            child: Row(
          children: [
            Image.asset('images/${forecast[index].numberIcon}.png'),
            const SizedBox(width: 2),
            Text(forecast[index].time),
            const Padding(padding: EdgeInsets.all(5)),
            Text('${forecast[index].temperature.toStringAsFixed(0)}ºC'),
            const Padding(padding: EdgeInsets.all(5)),
            Text(forecast[index].description),
          ],
        ));
      }),
    );
  }
}
