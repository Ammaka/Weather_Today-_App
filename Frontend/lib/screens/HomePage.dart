
import 'package:flutter/material.dart';
import '../Services/WeatherApi.dart';
import '../models/WeatherResponse.dart';
import 'WeatherPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<HomePage> {
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _weatherApi = WeatherApi();


  Weatherresponse? _weather;
  String? _error;
  bool _isLoading = false;


  Future<void> _getWeather() async {
    final city = _cityController.text.trim();
    final country = _countryController.text.trim();

    if (city.isEmpty || country.isEmpty) {
      setState(() {
        _error = 'Please enter both city and country';
        _weather = null;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });


    try {
      final Weatherresponse weather = await _weatherApi.fetchWeather(
        city: city,
        country: country,
      );

      if (!mounted) return;


      // this navigates only when my api call is succesfull
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherPage(weather: weather,),
        ),
      );
    } catch (e) {
      setState(() {
        _error = e.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }



  @override
  void dispose() {
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/Night Changes.jpg', fit: BoxFit.cover,)),
          // 🔹 Background image


          // 🔹 Foreground content (your existing UI)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextField(
                        controller: _cityController,
                        decoration:  InputDecoration(
                          labelText: 'City',
                          prefixIcon: Icon(Icons.location_city),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        controller: _countryController,
                        decoration:  InputDecoration(
                          labelText: 'Country',
                          prefixIcon: Icon(Icons.location_on),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _getWeather,
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Search'),
                      ),

                      if (_error != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          _error!,
                          style:  TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
