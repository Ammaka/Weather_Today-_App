
import 'package:flutter/material.dart';
import 'package:weather_today_app/models/WeatherResponse.dart';


class WeatherPage extends StatelessWidget {
  final Weatherresponse weather;
  const WeatherPage({super.key, required this.weather});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),
          ),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(
            '${weather.city}, ${weather.country}',
            style: const TextStyle(fontSize: 38,fontWeight: FontWeight.bold),
            ),
            Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text('Temperature: ${weather.temperature?.toStringAsFixed(1)} °C',
                      style: const TextStyle(fontSize: 20,),
                      ),
                      Text('but it feels like ${weather.feelsLike?.toStringAsFixed(1)} °C',
                        style: const TextStyle(fontSize: 20,),),
                      Text('Condition: ${weather.description},in details ${weather.main}', style: const TextStyle(fontSize: 22,),),
                      Text('Humidity: ${weather.humidity}%', style: const TextStyle(fontSize: 20,),),
                      Text('Lon: ${weather.lon}', style: const TextStyle(fontSize: 20,),),
                      Text('Lat: ${weather.lat}', style: const TextStyle(fontSize: 20,),),
                      Text('the sun rises at ${weather.sunrise} ,and it sets at ${weather.sunset}', style: const TextStyle(fontSize: 20,),),
                    ]
                                ),
                  )
            )
            ]
            )
        ),
      );
  }
}













