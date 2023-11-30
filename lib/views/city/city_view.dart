import 'package:flutter/material.dart';
import 'package:my_travel/models/activity.model.dart';
import 'package:my_travel/models/city_model.dart';
import 'package:my_travel/models/trip_model.dart';
import 'package:my_travel/views/home/home_view.dart';
import 'package:my_travel/views/widgets/activity_list.dart';
import 'package:my_travel/views/widgets/trip_activity_list.dart';
import 'package:my_travel/views/widgets/trip_overview.dart';
import 'package:my_travel/widgets/dyma_drawer.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final City city;
  final Function addTrip;

  List<Activity> get activities {
    return city.activities;
  }

  const CityView({
    super.key,
    required this.city,
    required this.addTrip,
  });

  showContext({required BuildContext context, required List<Widget> children}) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip mytrip;
  late int index;

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  double get amount {
    return mytrip.activities.fold(0.00, (prev, element) {
      var activity =
          widget.activities.firstWhere((activity) => activity.id == element);
      return prev + activity.price;
    });
  }

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: "Paris", date: null);
    index = 0;
  }

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2030),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
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
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Voulez vous sauvegarder ?'),
          contentPadding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pop(context, 'save');
                  },
                  child: const Text(
                    'Sauvegarder',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: const Text('Annuler'),
                ),
              ],
            )
          ],
        );
      },
    );
    if (result == 'save') {
      widget.addTrip(mytrip);
      if (mounted) Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation du voyage'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        child: widget.showContext(
          context: context,
          children: [
            TripOverview(
              setDate: setDate,
              myTrip: mytrip,
              cityName: widget.city.name,
              amount: amount,
            ),
            Expanded(
                child: index == 0
                    ? ActivityList(
                        activiies: widget.activities,
                        selectedActivities: mytrip.activities,
                        toogleActivity: toogleActivity,
                      )
                    : TripActivityList(
                        activities: tripActivities,
                        deleteTripActivity: deleteTripActivity,
                      )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: const Icon(Icons.forward),
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
