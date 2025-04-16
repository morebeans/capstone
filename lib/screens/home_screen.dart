import 'package:flutter/material.dart';
import 'profile_edit_screen.dart';
import '../models/feeding_schedule.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FeedingSchedule? nextFeeding;
  List<FeedingSchedule> feedingRecords = [];

  void _setFeedingSchedule() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    final label = await _askForLabel();
    if (label == null || label.trim().isEmpty) return;

    final measurement = await _askForMeasurement();
    if (measurement == null || measurement.trim().isEmpty) return;

    final newSchedule = FeedingSchedule(
      time: DateTime(date.year, date.month, date.day, time.hour, time.minute),
      label: label.trim(),
      measurement: measurement.trim(),
    );

    setState(() {
      nextFeeding = newSchedule;
      feedingRecords.add(newSchedule); // Save as a recorded feeding
    });
  }

  Future<String?> _askForLabel() async {
    String label = '';
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Feeding Label'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'e.g., breakfast'),
            onChanged: (value) => label = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, label),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<String?> _askForMeasurement() async {
    String input = '';
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Measurement'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'e.g., 200g'),
            onChanged: (value) => input = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, input),
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        title: const Text("Pet Feeding"),
        backgroundColor: colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileEditScreen(),
                ),
              );
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            nextFeeding == null
                ? const Text("No feeding scheduled yet")
                : Text(
                  "Next feeding: ${nextFeeding!.time}",
                  style: const TextStyle(fontSize: 16),
                ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _setFeedingSchedule,
              child: const Text("Schedule Feeding"),
            ),
            const SizedBox(height: 24),
            const Text(
              "Recorded Feedings:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child:
                  feedingRecords.isEmpty
                      ? const Center(child: Text("No records yet."))
                      : ListView.builder(
                        itemCount: feedingRecords.length,
                        itemBuilder: (context, index) {
                          return FeedingScheduleCard(
                            schedule: feedingRecords[index],
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
