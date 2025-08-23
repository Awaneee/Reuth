// import 'package:flutter/material.dart';
// import '../../data/repo.dart';
// import '../../widgets/common.dart';

// class CaregiverHome extends StatefulWidget {
//   const CaregiverHome({super.key});
//   @override State<CaregiverHome> createState() => _CaregiverHomeState();
// }

// class _CaregiverHomeState extends State<CaregiverHome> {
//   final idCtrl = TextEditingController();
//   final nameCtrl = TextEditingController();
//   final docCtrl = TextEditingController();
//   String? selectedPid;

//   void _addPatient() {
//     final id = idCtrl.text.trim();
//     final name = nameCtrl.text.trim();
//     final doc = docCtrl.text.trim();
//     if (id.isEmpty || name.isEmpty || doc.isEmpty) return;
//     repo.addPatient(Patient(id: id, name: name, doctorId: doc));
//     idCtrl.clear(); nameCtrl.clear(); docCtrl.clear();
//     setState((){});
//   }

//   void _addPrescription() {
//     if (selectedPid==null) return;
//     repo.addPrescription(selectedPid!, Prescription(name: 'NewMed', dose: '—', frequency: '—', reminders: const []));
//     setState((){});
//   }

//   @override Widget build(BuildContext context) {
//     final patients = repo.allPatients.toList();
//     selectedPid ??= patients.isNotEmpty ? patients.first.id : null;
//     return Scaffold(
//       appBar: AppBar(title: const Text('Caregiver Portal')),
//       body: ListView(padding: const EdgeInsets.all(12), children: [
//         sectionTitle('Add Patient'),
//         Card(child: Padding(padding: const EdgeInsets.all(8), child: Column(children: [
//           TextField(controller: idCtrl, decoration: const InputDecoration(labelText: 'Patient ID (PID)')),
//           TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
//           TextField(controller: docCtrl, decoration: const InputDecoration(labelText: 'Doctor ID (DID)')),
//           const SizedBox(height: 8),
//           ElevatedButton(onPressed: _addPatient, child: const Text('Add Patient')),
//         ]))),
//         sectionTitle('Add Prescription'),
//         Card(child: Padding(padding: const EdgeInsets.all(8), child: Column(children: [
//           DropdownButtonFormField<String>(value: selectedPid, items: patients.map((p)=>DropdownMenuItem(value: p.id, child: Text('${p.name} (${p.id})'))).toList(), onChanged: (v)=>setState(()=>selectedPid=v)),
//           const SizedBox(height: 8),
//           ElevatedButton(onPressed: _addPrescription, child: const Text('Add RX')),
//         ]))),
//         sectionTitle('Patients'),
//         ...patients.map((p) => Card(child: ListTile(title: Text('${p.name} (${p.id})'), subtitle: Text('Doctor: ${p.doctorId} • Rx: ${p.prescriptions.length}')))).toList(),
//       ]),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import '../../data/repo.dart';
// import '../../widgets/common.dart';

// class CaregiverHome extends StatefulWidget {
//   const CaregiverHome({super.key});
//   @override
//   State<CaregiverHome> createState() => _CaregiverHomeState();
// }

// class _CaregiverHomeState extends State<CaregiverHome> {
//   final idCtrl = TextEditingController();
//   final nameCtrl = TextEditingController();
//   final docCtrl = TextEditingController();
//   final prescPidCtrl = TextEditingController();

//   void _addPatient() {
//     final id = idCtrl.text.trim();
//     final name = nameCtrl.text.trim();
//     final doc = docCtrl.text.trim();
//     if (id.isEmpty || name.isEmpty || doc.isEmpty) return;

//     repo.addPatient(Patient(id: id, name: name, doctorId: doc));

//     idCtrl.clear();
//     nameCtrl.clear();
//     docCtrl.clear();

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final patients = repo.allPatients.toList();

//     return Scaffold(
//       appBar: AppBar(title: const Text('Caregiver Portal')),
//       body: ListView(
//         padding: const EdgeInsets.all(12),
//         children: [
//           sectionTitle('Add Patient'),
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   TextField(controller: idCtrl, decoration: const InputDecoration(labelText: 'Patient ID (PID)')),
//                   TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
//                   TextField(controller: docCtrl, decoration: const InputDecoration(labelText: 'Doctor ID (DID)')),
//                   const SizedBox(height: 8),
//                   ElevatedButton(onPressed: _addPatient, child: const Text('Add Patient')),
//                 ],
//               ),
//             ),
//           ),
//           sectionTitle('Add Prescription'),
//           Card(
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: prescPidCtrl,
//                     decoration: const InputDecoration(
//                       labelText: 'Enter Patient ID for Prescription',
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       final pid = prescPidCtrl.text.trim();
//                       if (pid.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Please enter a Patient ID')),
//                         );
//                         return;
//                       }
//                       final patientExists = repo.getPatient(pid) != null;
//                       if (!patientExists) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Patient ID not found')),
//                         );
//                         return;
//                       }
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => PrescriptionEntryScreen(pid: pid),
//                         ),
//                       ).then((_) {
//                         setState(() {});
//                         prescPidCtrl.clear();
//                       });
//                     },
//                     child: const Text('Add Prescription'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           sectionTitle('Patients'),
//           ...patients
//               .map((p) => Card(
//                     child: ListTile(
//                       title: Text('${p.name} (${p.id})'),
//                       subtitle: Text('Doctor: ${p.doctorId} • Rx: ${p.prescriptions.length}'),
//                     ),
//                   ))
//               .toList(),
//         ],
//       ),
//     );
//   }
// }

// class PrescriptionEntryScreen extends StatefulWidget {
//   final String pid;
//   const PrescriptionEntryScreen({super.key, required this.pid});

//   @override
//   State<PrescriptionEntryScreen> createState() => _PrescriptionEntryScreenState();
// }

// class _PrescriptionEntryScreenState extends State<PrescriptionEntryScreen> {
//   final nameCtrl = TextEditingController();
//   final doseCtrl = TextEditingController();
//   final freqCtrl = TextEditingController();

//   void _submit() {
//     final name = nameCtrl.text.trim();
//     final dose = doseCtrl.text.trim();
//     final freq = freqCtrl.text.trim();

//     if (name.isEmpty || dose.isEmpty || freq.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }

//     repo.addPrescription(
//       widget.pid,
//       Prescription(name: name, dose: dose, frequency: freq, reminders: const []),
//     );

//     Navigator.pop(context); // Go back to CaregiverHome
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('New Prescription')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Medicine Name')),
//             const SizedBox(height: 10),
//             TextField(controller: doseCtrl, decoration: const InputDecoration(labelText: 'Dose')),
//             const SizedBox(height: 10),
//             TextField(controller: freqCtrl, decoration: const InputDecoration(labelText: 'Frequency')),
//             const SizedBox(height: 20),
//             ElevatedButton(onPressed: _submit, child: const Text('Save Prescription')),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../../data/repo.dart';
import '../../widgets/common.dart';

class CaregiverHome extends StatefulWidget {
  const CaregiverHome({super.key});

  @override
  State<CaregiverHome> createState() => _CaregiverHomeState();
}

class _CaregiverHomeState extends State<CaregiverHome> {
  final idCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final docCtrl = TextEditingController();
  final prescPidCtrl = TextEditingController();

  @override
  void dispose() {
    idCtrl.dispose();
    nameCtrl.dispose();
    docCtrl.dispose();
    prescPidCtrl.dispose();
    super.dispose();
  }

  void _addPatient() {
    final id = idCtrl.text.trim();
    final name = nameCtrl.text.trim();
    final doc = docCtrl.text.trim();

    if (id.isEmpty || name.isEmpty || doc.isEmpty) {
      _showMessage('Please fill all fields');
      return;
    }

    if (repo.getPatient(id) != null) {
      _showMessage('Patient ID already exists');
      return;
    }

    // ✅ Make sure the DID exists (create if missing)
    if (repo.getDoctor(doc) == null) {
      repo.addDoctor(Doctor(id: doc, name: 'Doctor $doc'));
    }

    // ✅ Save the PID→DID link in repo
    repo.addPatient(Patient(id: id, name: name, doctorId: doc));

    idCtrl.clear();
    nameCtrl.clear();
    docCtrl.clear();

    _showMessage('Patient added successfully. They can now login with PID & DID.');
    setState(() {});
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final patients = repo.allPatients.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Caregiver Portal')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          sectionTitle('Add Patient'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                      controller: idCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Patient ID (PID)')),
                  TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(labelText: 'Name')),
                  TextField(
                      controller: docCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Doctor ID (DID)')),
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: _addPatient, child: const Text('Add Patient')),
                ],
              ),
            ),
          ),
          sectionTitle('Add Prescription'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: prescPidCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Enter Patient ID for Prescription',
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      final pid = prescPidCtrl.text.trim();
                      if (pid.isEmpty) {
                        _showMessage('Please enter a Patient ID');
                        return;
                      }
                      final patient = repo.getPatient(pid);
                      if (patient == null) {
                        _showMessage('Patient ID not found');
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PrescriptionEntryScreen(pid: pid),
                        ),
                      ).then((_) {
                        setState(() {});
                        prescPidCtrl.clear();
                      });
                    },
                    child: const Text('Add Prescription'),
                  ),
                ],
              ),
            ),
          ),
          sectionTitle('Patients'),
          if (patients.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('No patients added yet'),
              ),
            )
          else
            ...patients
                .map((p) => Card(
                      child: ListTile(
                        title: Text('${p.name} (${p.id})'),
                        subtitle: Text(
                            'Doctor: ${p.doctorId} • Rx: ${p.prescriptions.length}'),
                      ),
                    ))
                .toList(),
        ],
      ),
    );
  }
}

class PrescriptionEntryScreen extends StatefulWidget {
  final String pid;
  const PrescriptionEntryScreen({super.key, required this.pid});

  @override
  State<PrescriptionEntryScreen> createState() =>
      _PrescriptionEntryScreenState();
}

class _PrescriptionEntryScreenState extends State<PrescriptionEntryScreen> {
  final nameCtrl = TextEditingController();
  final doseCtrl = TextEditingController();
  final freqCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    doseCtrl.dispose();
    freqCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final name = nameCtrl.text.trim();
    final dose = doseCtrl.text.trim();
    final freq = freqCtrl.text.trim();

    if (name.isEmpty || dose.isEmpty || freq.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    repo.addPrescription(
      widget.pid,
      Prescription(
        name: name,
        dose: dose,
        frequency: freq,
        reminders: const [],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Prescription saved successfully')),
    );

    Navigator.pop(context); // Go back to CaregiverHome
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Prescription')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration:
                  const InputDecoration(labelText: 'Medicine Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: doseCtrl,
              decoration: const InputDecoration(labelText: 'Dose'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: freqCtrl,
              decoration: const InputDecoration(labelText: 'Frequency'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Save Prescription'),
            ),
          ],
        ),
      ),
    );
  }
}
