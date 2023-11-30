import 'package:flutter/material.dart';

import 'package:my_travel/models/city_model.dart';
import 'package:my_travel/views/widgets/city_card.dart';
import 'package:my_travel/widgets/dyma_drawer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  final List<City> cities;

  const HomeView({super.key, required this.cities});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dymatrip'),
      ),
      drawer: const DymaDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...widget.cities.map((city) => CityCard(city: city)).toList(),
          ],
        ),
      ),
    );
  }
}
