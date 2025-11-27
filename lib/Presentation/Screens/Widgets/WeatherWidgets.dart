import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          FaIcon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  final int weatherId;
  final int dt;
  final int sunrise;
  final int sunset;
  final double size;

  const WeatherIcon({
    super.key,
    required this.iconCode,
    required this.weatherId,
    required this.dt,
    required this.sunrise,
    required this.sunset,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDay = dt > sunrise && dt < sunset;
    final iconPrefix = iconCode.substring(0, 2);

    IconData icon;

    switch (iconPrefix) {
      case '01': // clear sky
        icon = isDay ? FontAwesomeIcons.sun : FontAwesomeIcons.moon;
        break;
      case '02': // few clouds
        icon = isDay ? FontAwesomeIcons.cloudSun : FontAwesomeIcons.cloudMoon;
        break;
      case '03': // scattered clouds
        icon = FontAwesomeIcons.cloud;
        break;
      case '04': // broken clouds
        icon = FontAwesomeIcons.cloud;
        break;
      case '09': // shower rain
        icon = FontAwesomeIcons.cloudRain;
        break;
      case '10': // rain
        icon = isDay ? FontAwesomeIcons.cloudSunRain : FontAwesomeIcons.cloudMoonRain;
        break;
      case '11': // thunderstorm
        icon = FontAwesomeIcons.bolt;
        break;
      case '13': // snow
        icon = FontAwesomeIcons.snowflake;
        break;
      case '50': // mist, fog, haze
        icon = FontAwesomeIcons.smog;
        break;
      default:
        icon = FontAwesomeIcons.sun; // Default icon
    }

    return FaIcon(
      icon,
      size: size,
      color: Colors.blue,
    );
  }
}

class WeatherInfoCard extends StatelessWidget {
  final Widget child;

  const WeatherInfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF5FF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Loading weather data...', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 8),
        CircularProgressIndicator(),
      ],
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red[100],
        border: Border.all(color: Colors.red.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Error! $message',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}