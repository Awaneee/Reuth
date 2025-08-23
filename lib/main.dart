// import 'package:flutter/material.dart';
// import 'screens/splash_screen.dart';

// void main() {
//   runApp(const ReuthHospitalApp());
// }

// class ReuthHospitalApp extends StatelessWidget {
//   const ReuthHospitalApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Reuth Hospital',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(useMaterial3: true),
//       home: const SplashScreen(),
//     );
//   }
// // }
// import 'package:flutter/material.dart';
// import 'screens/caregiver/home.dart';
// import 'screens/patient/login.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Reuth Hospital',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const RoleSelectScreen(),
//     );
//   }
// }

// // Simple role selection screen to choose login type
// class RoleSelectScreen extends StatelessWidget {
//   const RoleSelectScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Role')),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Caregiver goes to caregiver home
//                 Navigator.push(context, MaterialPageRoute(builder: (_) => const CaregiverHome()));
//               },
//               child: const Text('Caregiver Portal'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Patient goes to patient login
//                 Navigator.push(context, MaterialPageRoute(builder: (_) => const PatientLoginScreen()));
//               },
//               child: const Text('Patient Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hackto/screens/caregiver/login.dart';

import 'screens/patient/login.dart';
import 'screens/doctor/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reuth Hospital',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RoleSelectScreen(), // Use the unified RoleSelectScreen
    );
  }
}

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Role')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientLoginScreen()),
              ),
              child: const Text('Patient Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DoctorLogin()),
              ),
              child: const Text('Doctor Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CaregiverLoginScreen()),
              ),
              child: const Text('Caregiver Portal'),
            ),
          ],
        ),
      ),
    );
  }
}
