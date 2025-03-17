import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  Map loadData = {};

  void fetchTime() async {

    try{

      loadData = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
      if(loadData.isEmpty){
        loadData = {
          'location': 'Accra',
          'flag': 'ghana.png',
          'url' : 'Accra',
        };
      }
      print(loadData);


      WorldTime instance = WorldTime(
          location: loadData['location'], flag: loadData['flag'], url: loadData['url']
      );
      await instance.fetchData();
      await instance.fetchFocus();

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'datetime': instance.datetime,
        'isDay' : instance.isDay,
        'realDate' : instance.realDate,
        'humidity' : instance.humidity,
        'windSpeed' : instance.windSpeed,
        'temp' : instance.temp,
        'weatherDescription' : instance.weatherdescription,
      }
      );

    }catch(e){
      print('catch error: $e');
    }

  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) { // causes widget to be built before running the fetch function
      fetchTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: const SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }

}
