import 'package:client/Data/Models/WeatherData.dart';
import 'package:client/Data/Services/Weather.dart';
import 'package:client/Presentation/Screens/Widgets/WeatherWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Clima extends StatefulWidget {
  const Clima({super.key});

  @override
  State<Clima> createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {

  final String apiKey = 'YOUR_API_KEY_HERE';

  String _location = 'Hanoi';
  WeatherData? _weatherData;
  bool _isLoading = true;
  String? _error;
  final WeatherService _weatherService = WeatherService();

  final TextEditingController _searchController  = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    _fetchWeather(_location);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
      _error = null;
      _weatherData = null; // Clear previous data
    });

    try {
      final weatherData = await _weatherService.getWeather(city);
      setState(() {
        _weatherData = weatherData;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _error = err.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }


  void _handleSearchSubmit() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _location = query;
      });
      _fetchWeather(query);
    } else {
      setState(() {
        _error = 'Please enter a city name.';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clima")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          reverse: true, // giúp scroll lên khi bàn phím xuất hiện
          child: _buildMainCard(),
        ),
        ),
    );
  }



Widget _buildMainCard() {
  return Container(
    child: Column(
      children: [

        _buildSearchForm(),

        const SizedBox(height: 24),

        // Loading indicator
        if (_isLoading) const LoadingIndicator(),

        // Error message
        if (_error != null && !_isLoading) ErrorMessage(message: _error!),

        // Weather data
        if (_weatherData != null && !_isLoading && _error == null)
          _buildWeatherDisplay(),
      ],
    ),
  );
}


Widget _buildSearchForm() {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Enter city name (e.g., London, Tokyo)',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onSubmitted: (_) => _handleSearchSubmit(),
        ),
      ),
      const SizedBox(width: 12),
      ElevatedButton.icon(
        onPressed: _handleSearchSubmit,
        icon: const Icon(Icons.search),
        label: const Text('Search'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ],
  );
}

Widget _buildWeatherDisplay() {
  return Column(
    children: [
      // Location header
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, color: Colors.blue),
          const SizedBox(width: 4),
          Text(
            '${_weatherData!.name}, ${_weatherData!.country}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1F36),
            ),
          ),
        ],
      ),

      // Local time
      Text(
        '${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch((_weatherData!.dt + _weatherData!.timezone) * 1000, isUtc: true))} local time',
        style: const TextStyle(color: Colors.grey),
      ),

      const SizedBox(height: 24),

      // Weather details
      WeatherInfoCard(
        child: Column(
          children: [
            // Weather icon and description
            WeatherIcon(
              iconCode: _weatherData!.icon,
              weatherId: _weatherData!.weatherId,
              dt: _weatherData!.dt,
              sunrise: _weatherData!.sunrise,
              sunset: _weatherData!.sunset,
            ),
            const SizedBox(height: 8),
            Text(
              _weatherData!.description,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            // Temperature
            Text(
              '${_weatherData!.temp.round()}°C',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Feels like ${_weatherData!.feelsLike.round()}°C',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // Additional weather data
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 2.5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                WeatherDetailItem(
                  icon: FontAwesomeIcons.droplet,
                  label: 'Humidity',
                  value: '${_weatherData!.humidity}%',
                ),
                WeatherDetailItem(
                  icon: FontAwesomeIcons.wind,
                  label: 'Wind Speed',
                  value: '${_weatherData!.windSpeed} m/s',
                ),
                WeatherDetailItem(
                  icon: FontAwesomeIcons.temperatureLow,
                  label: 'Min Temp',
                  value: '${_weatherData!.tempMin.round()}°C',
                ),
                WeatherDetailItem(
                  icon: FontAwesomeIcons.temperatureHigh,
                  label: 'Max Temp',
                  value: '${_weatherData!.tempMax.round()}°C',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
}