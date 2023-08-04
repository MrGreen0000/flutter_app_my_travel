import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_travel/models/activity.model.dart';
import 'package:my_travel/data/data.dart' as data;
import 'package:my_travel/models/trip.model.dart';
import 'package:my_travel/views/widgets/activity_card.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  Trip myTrip = Trip(city: "Paris", activities: [], date: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.chevron_left),
          title: const Text('Paris'),
          actions: const <Widget>[Icon(Icons.more_vert)],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              color: Colors.white,
              child: Column(children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.all(8)),
                    Expanded(
                      child: Text(DateFormat("d/M/y").format(myTrip.date)),
                    ),
                    ElevatedButton(
                      child: const Text("Selectionner une date"),
                      onPressed: () {},
                    )
                  ],
                )
              ]),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 5,
                children: widget.activities
                    .map((activity) => ActivityCard(activity: activity))
                    .toList(),
              ),
            ),
          ],
        ));
  }
}
