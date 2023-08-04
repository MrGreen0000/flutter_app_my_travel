import 'package:flutter/material.dart';
import 'package:my_travel/models/activity.model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  const ActivityCard({
    required this.activity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Image.asset(
        activity.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
