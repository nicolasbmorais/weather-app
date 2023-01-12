import 'package:flutter/material.dart';
import 'package:weather_app/controller/theme_controller.dart';

class Resume extends StatelessWidget {
  final String city;
  final String description;
  final double currentTemperature;
  final double maximumTemperature;
  final double minimumTemperature;
  final int iconNumber;

  const Resume(
      {Key? key,
      required this.city,
      required this.description,
      required this.currentTemperature,
      required this.maximumTemperature,
      required this.minimumTemperature,
      required this.iconNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  const Icon(Icons.brightness_6_outlined),
                  Switch(
                    value: ThemeController.instance.isDarkTheme,
                    onChanged: (value) {
                      ThemeController.instance.changeTheme();
                    },
                  ),
                ],
              )
            ],
          ),
          Text(
            city,
            style: const TextStyle(fontSize: 18),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/$iconNumber.png')),
                Text(
                  '${currentTemperature.toStringAsFixed(0)}ºC',
                  style: const TextStyle(fontSize: 40),
                ),
                const VerticalDivider(
                  color: Colors.black,
                  thickness: 1
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${maximumTemperature.toStringAsFixed(0)}ºC',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${maximumTemperature.toStringAsFixed(0)}ºC',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 16)
          ),
        ],
      ),
    );
  }
}
