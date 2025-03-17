import 'package:flutter/material.dart';
import 'package:world_time/StyledBodyText.dart';
import 'package:world_time/StyledTitleText.dart';
import 'package:world_time/services/world_time.dart';


class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  List<WorldTime> location = [
    WorldTime(location: 'London', flag: 'uk.png', url: 'London'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Seoul'),
    WorldTime(location: 'Accra', flag: 'ghana.png', url: 'Accra'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Nairobi'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Cairo'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'Chicago'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Jakarta'),
    WorldTime(location: 'Mogadishu', flag: 'somali.png', url: 'Mogadishu'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'New York'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styledtitletext('Choose a Location'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[500],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Card (
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(15), // Ensure the container also has rounded corners
                        ),
                        padding: EdgeInsets.only(top: 30,bottom: 30),
                        height: 120,
                        child: ListTile(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/',arguments: {
                              'location': location[index].location,
                              'flag': location[index].flag,
                              'url' : location[index].url,
                            });
                          },
                          title: Text(location[index].location,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('lib/assets/${location[index].flag}'),
                            radius: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            );
          }
      ),
    );
  }
}
