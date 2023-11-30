import 'package:flutter/material.dart';

import 'package:my_travel/data/data.dart' as data;
import 'package:my_travel/models/city_model.dart';
import 'package:my_travel/models/trip_model.dart';
import 'package:my_travel/views/404/not_found.dart';
import 'package:my_travel/views/city/city_view.dart';
import 'package:my_travel/views/home/home_view.dart';
import 'package:my_travel/views/trips/trips_view.dart';

void main() => runApp(DymaTrip());

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;
  DymaTrip({super.key});

  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  List<Trip> trips = [];

  void addTrip(Trip trip) {
    setState(() {
      trips.add((trip));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.routeName: (context) => HomeView(cities: widget.cities),
      },
      // ignore: body_might_complete_normally_nullable
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CityView.routeName:
            {
              return MaterialPageRoute(
                builder: (context) {
                  final City city = settings.arguments as City;
                  return CityView(
                    city: city,
                    addTrip: addTrip,
                  );
                },
              );
            }
          case TripsView.routeName:
            {
              return MaterialPageRoute(
                builder: (context) {
                  return const TripsView();
                },
              );
            }
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
      },
    );
  }
}
