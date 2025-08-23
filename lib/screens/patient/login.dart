// import 'package:flutter/material.dart';
// import 'home.dart';

// class PatientLoginScreen extends StatefulWidget {
//   const PatientLoginScreen({super.key});

//   @override
//   State<PatientLoginScreen> createState() => _PatientLoginScreenState();
// }

// class _PatientLoginScreenState extends State<PatientLoginScreen> {
//   final _pidController = TextEditingController();
//   final _didController = TextEditingController();

//   final Map<String, String> dummyPatients = {
//     'pid123': 'did456',
//     'pid999': 'did888',
//   };

//   String? errorMessage;

//   void login() {
//     final pid = _pidController.text.trim();
//     final did = _didController.text.trim();

//     if (pid.isEmpty || did.isEmpty) {
//       setState(
//           () => errorMessage = 'Please enter both Patient ID and Doctor ID');
//       return;
//     }

//     if (dummyPatients[pid] == did) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (_) => PatientHomeScreen(pid: pid, did: did),
//         ),
//       );
//     } else {
//       setState(() => errorMessage = 'Invalid Patient ID or Doctor ID');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(title: const Text('Patient Login')),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               TextField(
//                 controller: _pidController,
//                 cursorColor: Colors.blue,
//                 style: const TextStyle(color: Colors.black), // ✅ text visible
//                 decoration: const InputDecoration(
//                   labelText: 'Patient ID',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               TextField(
//                 controller: _didController,
//                 cursorColor: Colors.blue,
//                 style: const TextStyle(color: Colors.black),
//                 decoration: const InputDecoration(
//                   labelText: 'Doctor ID',
//                   border: OutlineInputBorder(),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: login,
//                 child: const Text("Login"),
//               ),
//               if (errorMessage != null) ...[
//                 const SizedBox(height: 10),
//                 Text(errorMessage!, style: const TextStyle(color: Colors.red)),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hackto/data/repo.dart';
import 'home.dart';


class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({super.key});

  @override
  State<PatientLoginScreen> createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  final _pidController = TextEditingController();
  final _didController = TextEditingController();

  String? errorMessage;

  void login() {
    final pid = _pidController.text.trim();
    final did = _didController.text.trim();

    if (pid.isEmpty || did.isEmpty) {
      setState(() => errorMessage = 'Please enter both Patient ID and Doctor ID');
      return;
    }

    // ✅ Check in Repo
    final patient = repo.getPatient(pid);

    if (patient != null && patient.doctorId == did) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PatientHomeScreen(pid: pid, did: did),
        ),
      );
    } else {
      setState(() => errorMessage = 'Invalid Patient ID or Doctor ID');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Patient Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _pidController,
                cursorColor: Colors.blue,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Patient ID',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _didController,
                cursorColor: Colors.blue,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Doctor ID',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: login,
                child: const Text("Login"),
              ),
              if (errorMessage != null) ...[
                const SizedBox(height: 10),
                Text(errorMessage!, style: const TextStyle(color: Colors.red)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
