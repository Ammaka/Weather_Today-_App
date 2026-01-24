
import 'package:flutter/material.dart';
import 'package:weather_today_app/models/WeatherResponse.dart';


class WeatherPage extends StatelessWidget {
  final Weatherresponse weather;
  const WeatherPage({super.key, required this.weather});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),
          ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // City and Country Text
              Text(
                '${weather.city}, ${weather.country}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),


              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Temperature: ${weather.temperature?.toStringAsFixed(1)} °C',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'but it feels like ${weather.feelsLike?.toStringAsFixed(1)} °C',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Condition: ${weather.main} \nIn details: ${weather.description}',
                        style: const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(
                        'Humidity: ${weather.humidity}%',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Lon: ${weather.lon}',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Lat: ${weather.lat}',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        'Sunrise: ${weather.sunrise}\nSunset: ${weather.sunset}',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}













