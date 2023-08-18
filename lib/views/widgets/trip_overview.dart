import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_travel/models/trip.model.dart';

class TripOverview extends StatelessWidget {
  final VoidCallback setDate;
  final Trip myTrip;

  double get amount {
    return 0;
  }

  const TripOverview({
    required this.setDate,
    required this.myTrip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Paris",
            style:
                TextStyle(fontSize: 25, decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(8)),
              Expanded(
                child: Text(myTrip.date != null
                    ? DateFormat("d/M/y").format(myTrip.date!)
                    : "Sélectionner une date"),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: const Text("Sélectionner une date"),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Montant / Personne",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                '$amount€',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
