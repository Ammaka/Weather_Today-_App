// modells the WeatherTodayDTO class from the backend

class Weatherresponse{
  final String? city;
  final String? country;
  final double? lon;
  final double? lat;
  final double? temperature;
  final double? feelsLike;
  final double? humidity;
  final String? sunrise;
  final String? sunset;
  final String? main;
  final String? description;

  //nameless constructor or the class
  Weatherresponse({
    required this.city,
    required this.country,
    required this.lon,
    required this.lat,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.main,
    required this.description
});

  factory Weatherresponse.fromJson(Map<String, dynamic> json){
    return Weatherresponse(
      city: json['city'] as String?,
      country: json['country'] as String?,
      lon: json['lon'] as double?,
      lat: json['lat'] as double?,
      temperature: json['temperature'] as double?,
      feelsLike: json['feelsLike'] as double?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      main: json['main'] as String?,
      description: json['description']  as String?,
      humidity: json['humidity'] as double?,
    );
  }
}

