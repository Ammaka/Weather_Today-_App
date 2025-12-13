import 'package:flutter/material.dart';
import 'Services/WeatherApi.dart';
import 'models/WeatherResponse.dart';
import 'services/WeatherApi.dart' hide WeatherApi;
import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Today',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _weatherApi = WeatherApi();

  Weatherresponse? _weather;
  String? _error;
  bool _isLoading = false;

  @override
  void dispose() {
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }

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
      final result = await _weatherApi.fetchWeather(
        city: city,
        country: country,
      );
      setState(() {
        _weather = result;
        _error = null;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _weather = null;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildResult() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Text(
        _error!,
        style: const TextStyle(color: Colors.red),
      );
    }

    if (_weather == null) {
      return const Text('Enter a city and country, then tap "Get Weather".');
    }

    final w = _weather!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${w.city}, ${w.country}',
          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text('Temperature: ${w.temperature?.toStringAsFixed(1)} °C'),
        Text('but it feels like ${w.feelsLike?.toStringAsFixed(1)} °C'),
        Text('Condition: ${w.description},in details ${w.main}'),
        Text('Humidity: ${w.humidity}%'),
        Text('Lon: ${w.lon}'),
        Text('Lat: ${w.lat}'),
        Text('the sun rises at ${w.sunrise} ,and it sets at ${w.sunset}'),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'e.g. Berlin',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _countryController,
              decoration: const InputDecoration(
                labelText: 'Country',
                hintText: 'e.g. Germany',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _getWeather,
                child: const Text('Get Weather'),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: _buildResult(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
