import 'package:flutter/material.dart';
import 'package:my_travel/models/city_model.dart';
import 'package:my_travel/views/404/not_found.dart';
import 'package:my_travel/views/city/city_view.dart';
import 'package:my_travel/views/home/home_view.dart';

void main() => runApp(const DymaTrip());

class DymaTrip extends StatelessWidget {
  const DymaTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeView(),
      routes: {
        HomeView.routeName: (context) {
          return const HomeView();
        },
      },
      onGenerateRoute: (settings) {
        if (settings.name == CityView.routeName) {
          final City city = settings.arguments as City;
          return MaterialPageRoute(
            builder: (context) {
              return CityView(city: city);
            },
          );
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFound(),
        );
      },
    );
  }
}
