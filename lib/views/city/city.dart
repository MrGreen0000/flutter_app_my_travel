import 'package:flutter/material.dart';
import 'package:my_travel/models/activity.model.dart';
import 'package:my_travel/data/data.dart' as data;
import 'package:my_travel/models/trip.model.dart';
import 'package:my_travel/views/widgets/activity_list.dart';
import 'package:my_travel/views/widgets/trip_activity_list.dart';
import 'package:my_travel/views/widgets/trip_overview.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;
  City({super.key});

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late Trip myTrip;

  late int index;

  @override
  void initState() {
    super.initState();
    myTrip = Trip(activities: [], city: "Paris", date: null);
    index = 0;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => myTrip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          myTrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toogleActivity(String id) {
    setState(() {
      myTrip.activities.contains(id)
          ? myTrip.activities.remove(id)
          : myTrip.activities.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left),
        title: const Text('Organisation du voyage'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          TripOverview(setDate: setDate, myTrip: myTrip),
          Expanded(
              child: index == 0
                  ? ActivityList(
                      activiies: widget.activities,
                      selectedActivities: myTrip.activities,
                      toogleActivity: toogleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                    )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Découvert",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: "Mes activités",
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
