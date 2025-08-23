import 'package:flutter/material.dart';
import 'package:hackto/data/repo.dart';

class MedicationTrackerScreen extends StatefulWidget {
  final String pid;
  const MedicationTrackerScreen({super.key, required this.pid});

  @override
  State<MedicationTrackerScreen> createState() =>
      _MedicationTrackerScreenState();
}

class _MedicationTrackerScreenState extends State<MedicationTrackerScreen> {
  final Map<String, bool> medStatus = {};

  @override
  void initState() {
    super.initState();
    final patient = repo.getPatient(widget.pid);
    if (patient != null) {
      for (var presc in patient.prescriptions) {
        medStatus[presc.name] = false; // ✅ Track per prescription
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (medStatus.isEmpty) {
      return const Center(child: Text("No medications found"));
    }
    return ListView(
      padding: const EdgeInsets.all(16),
      children: medStatus.keys.map((med) {
        return Card(
          child: ListTile(
            title: Text(med),
            subtitle: const Text("Tap toggle to mark as taken"),
            trailing: Switch(
              value: medStatus[med]!,
              onChanged: (val) {
                setState(() => medStatus[med] = val);
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
