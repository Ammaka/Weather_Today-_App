
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_today_app/models/WeatherResponse.dart';

class WeatherApi{
static const String  base_Url = "http://10.0.2.2:8080";


Future<Weatherresponse> fetchWeather({
  required String city,
  required String country,
}) async {
  final uri= Uri.parse('$base_Url/weather?city=$city&country=$country').replace(
    queryParameters: {
      "city":city,
      "country":country,
    },
  );

  final response = await http.get(uri);
  if (response.statusCode==200) {
    final Map<String,dynamic> jsonBody= json.decode(response.body);
    return Weatherresponse.fromJson(jsonBody);
  } else{
    throw Exception(
      "failed to load weather(${response.statusCode}) : ${response.body}"
    );
  }
}
}