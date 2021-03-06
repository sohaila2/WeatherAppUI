/*
Example of API response
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
    "pressure": 1023,
    "humidity": 100
  },
  "name": "Mountain View",
  }
 */


class WeatherResponse{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({this.cityName, this.tempInfo, this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);


    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromjson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }

}

class TemperatureInfo {
  final double temperature;
  TemperatureInfo({this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({this.description, this.icon});
  factory WeatherInfo.fromjson(Map<String, dynamic> json){
    final description = json['description'];
    final icon = json['icon'];

    return WeatherInfo(description: description, icon: icon);
  }
}

