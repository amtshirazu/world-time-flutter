import 'package:flutter/material.dart';
import 'package:world_time/StyledBodyText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  Widget weatherCondition(String descrip) {
    Widget weatherImage;
    switch (descrip) {
      case 'Rain':
        weatherImage =
            Image.asset('lib/assets/rain.png', width: 150, height: 150);
        break;
      case 'Clouds':
        weatherImage =
            Image.asset('lib/assets/clouds.png', width: 150, height: 150);
        break;
      case 'Clear':
        weatherImage =
            Image.asset('lib/assets/clear.png', width: 150, height: 150);
        break;
      case 'Snow':
        weatherImage =
            Image.asset('lib/assets/snow.png', width: 150, height: 150);
        break;
      case 'Mist':
        weatherImage =
            Image.asset('lib/assets/mist.png', width: 150, height: 150);
        break;
      default:
        weatherImage =
            Image.asset('lib/assets/clear.png', width: 150, height: 150);

    }
    return weatherImage;
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};


    String bgImg = data['isDay'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/$bgImg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(
                    Icons.edit_location,
                    size: 30,
                    color: Colors.grey[200],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[200], fontSize: 25),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 45,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(width: 5),

                    Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('lib/assets/${data['flag']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Text(
                  data['datetime'],
                  style: TextStyle(
                    fontSize: 55,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  data['realDate'],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),

                Divider(height: 30, color: Colors.white, thickness: 5),

                Container(
                  child: weatherCondition(data['weatherDescription']),
                ),

                Text(
                  '${data['temp']}°C',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/humidity.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(width: 5,),

                        Column(
                          children: [
                            Text(
                              '${data['humidity']}%',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),


                            Text(
                              'Humidity',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Image.asset(
                          'lib/assets/wind.png',
                          width: 60,
                          height: 60,
                        ),

                        SizedBox(width: 5,),

                        Column(
                          children: [
                            Text(
                              '${data['windSpeed']} Km/h',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              'Wind Speed',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
