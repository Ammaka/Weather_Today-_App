
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_today_app/models/WeatherResponse.dart';

//take note base_Url for emulator is "http://10.0.2.2:8080"
//base url for web http://localhost:8080";
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
  }
  else if(city.isEmpty || country.isEmpty){
    throw Exception("Please enter both city and country");
  }
  else if(response.statusCode==404){
    throw Exception(
        "Enter the correct City(${response.statusCode}) : ${response.body}");
  }
    else{
    throw Exception(
      "Error ${response.statusCode}\n pls ensure that the city and country are correct"
    );
  }
}
}