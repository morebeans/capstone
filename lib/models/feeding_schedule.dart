import 'package:flutter/material.dart';

class FeedingSchedule {
  final DateTime time;
  final String label;
  final String measurement;

  FeedingSchedule({
    required this.time,
    required this.label,
    required this.measurement,
  });

  // Convert the FeedingSchedule to a map for easy storage (e.g., in a database or local storage)
  Map<String, dynamic> toMap() {
    return {
      'time': time.toIso8601String(),
      'label': label,
      'measurement': measurement,
    };
  }

  // Convert a map to a FeedingSchedule object
  factory FeedingSchedule.fromMap(Map<String, dynamic> map) {
    return FeedingSchedule(
      time: DateTime.parse(map['time']),
      label: map['label'],
      measurement: map['measurement'],
    );
  }
}

class FeedingScheduleCard extends StatelessWidget {
  final FeedingSchedule schedule;

  const FeedingScheduleCard({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final formattedTime =
        "${schedule.time.hour}:${schedule.time.minute.toString().padLeft(2, '0')}";

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Feeding Time: $formattedTime",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Label: ${schedule.label}",
              style: TextStyle(fontSize: 16, color: colorScheme.secondary),
            ),
            Text(
              "Measurement: ${schedule.measurement}",
              style: TextStyle(fontSize: 16, color: colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
