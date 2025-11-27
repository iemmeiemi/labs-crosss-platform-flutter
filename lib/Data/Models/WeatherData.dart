class WeatherData {
  final String name;
  final String country;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int humidity;
  final int pressure;
  final double tempMin;
  final double tempMax;
  final int weatherId;
  final String main;
  final String description;
  final String icon;
  final double windSpeed;
  final int windDeg;
  final int dt;
  final int timezone;

  WeatherData({
    required this.name,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.tempMin,
    required this.tempMax,
    required this.weatherId,
    required this.main,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.windDeg,
    required this.dt,
    required this.timezone,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      weatherId: json['weather'][0]['id'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      windSpeed: json['wind']['speed'].toDouble(),
      windDeg: json['wind']['deg'],
      dt: json['dt'],
      timezone: json['timezone'],
    );
  }
}