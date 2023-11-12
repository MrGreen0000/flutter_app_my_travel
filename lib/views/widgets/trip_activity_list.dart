import 'package:flutter/material.dart';
import 'package:my_travel/models/activity.model.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({
    required this.activities,
    required this.deleteTripActivity,
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
            subtitle: Text(activity.city),
            trailing: IconButton(
              onPressed: () => deleteTripActivity(activity.id),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        );
      }),
      itemCount: activities.length,
    );
  }
}
