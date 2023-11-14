import 'package:flutter/material.dart';
import 'package:my_travel/models/city_model.dart';
import 'package:my_travel/views/widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<City> cities = [
    City(image: 'assets/images/lyon.jpg', name: 'Lyon'),
    City(image: 'assets/images/biarritz.jpg', name: 'Biarritz'),
    City(image: 'assets/images/paris.jpg', name: 'Paris'),
  ];

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
              (city) => CityCard(city: city),
            ),
          ],
        ),
      ),
    );
  }
}
