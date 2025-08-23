import 'package:flutter/material.dart';
import 'home.dart';
import '../../data/repo.dart';

class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});
  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  final did = TextEditingController(text: 'D100');
  String? error;
  void _login() {
    final d = repo.getDoctor(did.text.trim());
    if (d != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => DoctorHomeScreen(doctorId: d.id)));
    } else {
      setState(() => error = 'Invalid DID');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Login')),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(
                controller: did,
                decoration: const InputDecoration(labelText: 'Doctor ID')),
            const SizedBox(height: 12),
            if (error != null)
              Text(error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
          ])),
    );
  }
}
