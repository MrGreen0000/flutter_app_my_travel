import 'package:flutter/material.dart';
import 'package:my_travel/widgets/dyma_drawer.dart';

class TripsView extends StatefulWidget {
  static const String routeName = '/trips';
  const TripsView({super.key});

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
      ),
      drawer: const DymaDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: const Text('trips'),
      ),
    );
  }
}
