import 'package:flutter/material.dart';
import 'package:my_travel/models/activity.model.dart';
import 'package:my_travel/views/trip/widgets/trip_activity_list.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;

  const TripActivities({
    super.key,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                text: 'En cours',
              ),
              Tab(
                text: 'Terminé',
              ),
            ],
          ),
          SizedBox(
            height: 600,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TripActivityList(
                  activities: activities
                      .where((activity) =>
                          activity.status == ActivityStatus.ongoing)
                      .toList(),
                  filter: ActivityStatus.ongoing,
                ),
                TripActivityList(
                  activities: activities
                      .where(
                          (activity) => activity.status == ActivityStatus.done)
                      .toList(),
                  filter: ActivityStatus.done,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
