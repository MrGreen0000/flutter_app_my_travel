import 'package:flutter/material.dart';
import 'package:my_travel/views/widgets/city_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List cities = [
    {
      'name': 'Lyon',
      'image': 'assets/images/lyon.jpg',
      'checked': false,
    },
    {
      'name': 'Biarritz',
      'image': 'assets/images/biarritz.jpg',
      'checked': false,
    },
    {
      'name': 'Paris',
      'image': 'assets/images/paris.jpg',
      'checked': false,
    },
  ];

  void switchCehecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('dymatrip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map(
              (city) => CityCard(
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: () => switchCehecked(city),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
