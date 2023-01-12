// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TimeForecast {
  final String time;
  final String description;
  final int numberIcon;
  final double temperature;

  TimeForecast(
    this.time,
    this.description,
    this.numberIcon,
    this.temperature,
  );

  TimeForecast copyWith({
    String? time,
    String? description,
    int? numberIcon,
    double? temperature,
  }) {
    return TimeForecast(
      time ?? this.time,
      description ?? this.description,
      numberIcon ?? this.numberIcon,
      temperature ?? this.temperature,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'description': description,
      'numberIcon': numberIcon,
      'temperature': temperature,
    };
  }

  factory TimeForecast.fromMap(Map<String, dynamic> map) {
    return TimeForecast(
      map['DateTime'] != null ? map.toString().split('T')[1].substring(0, 5) : '',
      map['IconPhrase'] as String,
      map['WeatherIcon'] as int,
      map['Temperature']['Value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeForecast.fromJson(String source) => TimeForecast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TimeForecast(time: $time, description: $description, numberIcon: $numberIcon, temperature: $temperature)';
  }

  @override
  bool operator ==(covariant TimeForecast other) {
    if (identical(this, other)) return true;

    return other.time == time && other.description == description && other.numberIcon == numberIcon && other.temperature == temperature;
  }

  @override
  int get hashCode {
    return time.hashCode ^ description.hashCode ^ numberIcon.hashCode ^ temperature.hashCode;
  }
}
