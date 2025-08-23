import 'package:flutter/material.dart';
import 'package:hackto/data/repo.dart';

class PrescriptionScreen extends StatelessWidget {
  final String pid;
  const PrescriptionScreen({super.key, required this.pid});

  @override
  Widget build(BuildContext context) {
    final patient = repo.getPatient(pid);
    if (patient == null) {
      return const Center(child: Text("No patient found"));
    }
    final prescriptions = patient.prescriptions;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: prescriptions.length,
      itemBuilder: (context, i) {
        final presc = prescriptions[i];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ExpansionTile(
            title: Text("Prescription ${i + 1}"),
            children: [
              ListTile(
                title: Text(presc.name),
                subtitle: Text("${presc.dose} • ${presc.frequency}"),
              ),
            ],
          ),
        );
      },
    );
  }
}
