import 'package:flutter/material.dart';

class FeedingSchedule {
  final DateTime time;
  final String label;
  final String measurement;
  final String breed; // Added breed property

  FeedingSchedule({
    required this.time,
    required this.label,
    required this.measurement,
    required this.breed, // Added breed in constructor
  });
}

class FeedingScheduleCard extends StatelessWidget {
  final FeedingSchedule schedule;

  const FeedingScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(schedule.label),
        subtitle: Text(
          "${schedule.time}\nBreed: ${schedule.breed}\nMeasurement: ${schedule.measurement}",
        ),
      ),
    );
  }
}
