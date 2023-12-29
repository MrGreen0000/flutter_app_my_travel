import 'package:flutter/material.dart';
import 'package:my_travel/models/city_model.dart';
import 'package:my_travel/models/trip_model.dart';
import 'package:my_travel/providers/city_provider.dart';
import 'package:my_travel/providers/trip_provider.dart';
import 'package:my_travel/views/trip/widgets/trip_activities.dart';
import 'package:my_travel/views/trip/widgets/trip_city_bar.dart';
import 'package:provider/provider.dart';

class TripView extends StatelessWidget {
  static const String routeName = '/trip';

  const TripView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String cityName = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['cityName'] as String;
    final String tripId = (ModalRoute.of(context)!.settings.arguments
        as Map<String, String>)['tripId'] as String;
    final City city =
        Provider.of<CityProvider>(context).getCityByName(cityName);
    final Trip trip = Provider.of<TripProvider>(context).getById(tripId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripCityBar(city: city),
            TripActivities(activities: trip.activities),
          ],
        ),
      ),
    );
  }
}
