import 'package:flutter/material.dart';
import 'package:hackto/main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RoleSelectScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.local_hospital, size: 72, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 12),
        const Text('REUTH HOSPITAL', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ])),
    );
  }
}
