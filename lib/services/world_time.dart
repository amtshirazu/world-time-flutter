import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String datetime = '';
  String realDate = '';
  String location = '';
  String flag = '';
  String url = '';
  String apiKey = '180598e73ad8408a81dafc0a5b6f9413';
  int humidity = 0;
  int windSpeed = 0;
  int temp = 0;
  String weatherdescription = '';
  String apiWeather = '0997fca19ee2821ee96d27cba91baad4';
  late bool isDay;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> fetchData() async {
    try {
      Response response = await get(
        Uri.parse(
          'https://timezone.abstractapi.com/v1/current_time/?api_key=$apiKey&location=$url',
        ),
      );
      Map data = jsonDecode(response.body);

      datetime = data['datetime'];

      DateTime timeNow = DateTime.parse(datetime);

      isDay = timeNow.hour > 6 && timeNow.hour < 19 ? true : false;

      datetime = DateFormat.jm().format(timeNow);
      realDate = DateFormat.yMMMMd().format(timeNow);

    } catch (e) {
      print('catch error: $e');
    }
  }

  Future<void> fetchFocus() async {
    try {
      Response response = await get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$url&appid=$apiWeather&units=metric',
        ),
      );
      Map data = jsonDecode(response.body);
      humidity = data['main']['humidity'];
      double newTemp = data['main']['temp'];
       temp = newTemp.round();
      double newWindSpeed = data['wind']['speed'];
      windSpeed = newWindSpeed.round();
      weatherdescription = data['weather'][0]['main'];


    } catch (e) {
      print('catch error: $e');
    }
  }
}
