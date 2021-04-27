import 'package:http/http.dart' as http;
import 'package:weather_app_ui/models.dart';
import 'dart:convert';



class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // 'api.openweathermap.org'/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters =
    {'q':city,
      'appid' : '2ac82c6194534c28442638d40296e03b',
      'units' : 'imperial'
    };



    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather',queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);

  }

}
