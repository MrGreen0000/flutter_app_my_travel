import 'package:flutter/material.dart';
import 'package:my_travel/models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;

  const TripActivityList({
    required this.activities,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        var activity = activities[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.image),
            ),
            title: Text(activity.name),
            trailing: const Icon(Icons.delete),
          ),
        );
      }),
      itemCount: activities.length,
    );
  }
}
