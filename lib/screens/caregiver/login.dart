// // import 'package:flutter/material.dart';
// // import 'home.dart';

// // class CaregiverLogin extends StatelessWidget {
// //   const CaregiverLogin({super.key});
// //   @override Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Caregiver')),
// //       body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [
// //         TextField(decoration: const InputDecoration(labelText: 'Name')),
// //         const SizedBox(height: 12),
// //         ElevatedButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const CaregiverHome())), child: const Text('Continue')),
// //       ])),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import '../../data/repo.dart';

// // class CaregiverHome extends StatefulWidget {
// //   const CaregiverHome({super.key});
// //   @override
// //   State<CaregiverHome> createState() => _CaregiverHomeState();
// // }

// // class _CaregiverHomeState extends State<CaregiverHome> {
// //   final idCtrl = TextEditingController();
// //   final nameCtrl = TextEditingController();
// //   final docCtrl = TextEditingController();

// //   void _addPatient() {
// //     final id = idCtrl.text.trim();
// //     final name = nameCtrl.text.trim();
// //     final doc = docCtrl.text.trim();
// //     if (id.isEmpty || name.isEmpty || doc.isEmpty) return;

// //     repo.addPatient(Patient(id: id, name: name, doctorId: doc));

// //     idCtrl.clear();
// //     nameCtrl.clear();
// //     docCtrl.clear();

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final patients = repo.allPatients.toList();

// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Caregiver Portal')),
// //       body: ListView(
// //         padding: const EdgeInsets.all(12),
// //         children: [
// //           const Text('Add Patient', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //           Card(
// //             child: Padding(
// //               padding: const EdgeInsets.all(8),
// //               child: Column(
// //                 children: [
// //                   TextField(controller: idCtrl, decoration: const InputDecoration(labelText: 'Patient ID')),
// //                   TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Patient Name')),
// //                   TextField(controller: docCtrl, decoration: const InputDecoration(labelText: 'Doctor ID')),
// //                   const SizedBox(height: 8),
// //                   ElevatedButton(onPressed: _addPatient, child: const Text('Add Patient')),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           const Text('Existing Patients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //           ...patients.map((p) => Card(
// //             child: ListTile(
// //               title: Text('${p.name} (${p.id})'),
// //               subtitle: Text('Doctor: ${p.doctorId} • Prescriptions: ${p.prescriptions.length}'),
// //             ),
// //           )),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hackto/screens/caregiver/home.dart';
// import '../../data/repo.dart';

// class CaregiverLoginScreen extends StatefulWidget {
//   const CaregiverLoginScreen({super.key});

//   @override
//   State<CaregiverLoginScreen> createState() => _CaregiverLoginScreenState();
// }

// class _CaregiverLoginScreenState extends State<CaregiverLoginScreen> {
//   final codeController = TextEditingController();
//   String error = '';

//   void _checkCode() {
//     if (codeController.text.trim() == 'CARE@reuth') {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const CaregiverHomeScreen()),
//       );
//     } else {
//       setState(() {
//         error = 'Invalid special code';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Caregiver Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Enter Special Caregiver Code',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: codeController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Special Code',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             if (error.isNotEmpty) ...[
//               const SizedBox(height: 10),
//               Text(error, style: const TextStyle(color: Colors.red)),
//             ],
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _checkCode,
//               child: const Text('Enter Portal'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
