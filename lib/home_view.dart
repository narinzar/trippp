import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Trip.dart';

class HomeView extends StatelessWidget {
  final List<Trip> tripsList = [
    Trip('New York', DateTime.now(), DateTime.now(), 205, 'Car'),
    Trip('Boston', DateTime.now(), DateTime.now(), 450, 'Plane'),
    Trip('Washington D.C', DateTime.now(), DateTime.now(), 900, 'Bus'),
    Trip('Austin', DateTime.now(), DateTime.now(), 170, 'Car'),
    Trip('Harrisonburg', DateTime.now(), DateTime.now(), 180, 'Car'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //         Text(index.toString()),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4),
                child: Row(
                  children: [
                    Text(
                      trip.title,
                      style: TextStyle(fontSize: 30),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 80),
                child: Row(
                  children: [
                    Text(
                        "${DateFormat('dd/MM/yyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyy').format(trip.endDate).toString()}"),
                    Spacer(),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "\$${trip.budget.toStringAsFixed(2)}, style: TextStyle(fontSize: 35)"
                    ),
                    Spacer(),
                    Icon(Icons.directions_car),
                    Text(trip.travelType),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
