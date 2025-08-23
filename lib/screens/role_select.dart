// // import 'package:flutter/material.dart';
// // import 'doctor/login.dart';
// // import 'patient/login.dart';
// // import 'caregiver/login.dart';

// // class RoleSelectScreen extends StatelessWidget {
// //   const RoleSelectScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Select Role')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () => Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const PatientLoginScreen()),
// //               ),
// //               child: const Text('Patient'),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () => Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const DoctorLogin()),
// //               ),
// //               child: const Text('Doctor'),
// //             ),
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () => Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (_) => const CaregiverHome()),
// //               ),
// //               child: const Text('Caregiver'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'doctor/login.dart';
// import 'patient/login.dart';
// import 'caregiver/login.dart';

// class RoleSelectScreen extends StatelessWidget {
//   const RoleSelectScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Role')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => Navigator.pushReplacement(  // Use pushReplacement
//                 context,
//                 MaterialPageRoute(builder: (_) => const PatientLoginScreen()),
//               ),
//               child: const Text('Patient'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (_) => const DoctorLogin()),
//               ),
//               child: const Text('Doctor'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => Navigator.pushReplacement(  // Here fix: go to CaregiverLogin, NOT Home
//                 context,
//                 MaterialPageRoute(builder: (_) => const CaregiverHome()),  // fix here
//               ),
//               child: const Text('Caregiver'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
