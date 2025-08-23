// // import 'package:flutter/material.dart';

// // class PatientHomeScreen extends StatefulWidget {
// //   final String pid;
// //   final String did;

// //   const PatientHomeScreen({super.key, required this.pid, required this.did});

// //   @override
// //   State<PatientHomeScreen> createState() => _PatientHomeScreenState();
// // }

// // class _PatientHomeScreenState extends State<PatientHomeScreen> {
// //   int _currentIndex = 0;

// //   final List<Widget> _screens = const [
// //     DashboardScreen(),
// //     AppointmentScreen(),
// //     TreatmentPlanScreen(),
// //     MedicationTrackerScreen(),
// //     MessagesScreen(),
// //     RecordsScreen(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _screens[_currentIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: _currentIndex,
// //         type: BottomNavigationBarType.fixed,
// //         onTap: (index) => setState(() => _currentIndex = index),
// //         items: const [
// //           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
// //           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
// //           BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Treatment'),
// //           BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Medication'),
// //           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
// //           BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Records'),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Dashboard Screen -----------------------------
// // class DashboardScreen extends StatelessWidget {
// //   const DashboardScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Treatment Timeline", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const ListTile(title: Text("Initial Assessment - Jan 15, 2024")),
// //           const ListTile(title: Text("Physical Therapy - Feb 1 to Mar 15")),
// //           const ListTile(title: Text("Medication Review - Mar 22, 2024")),
// //           const ListTile(title: Text("Follow-up Consultation - Apr 5, 2024")),
// //           const Divider(),
// //           const Text("Upcoming Appointments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const ListTile(title: Text("Dr. Emily White - Aug 23, 2025")),
// //           const ListTile(title: Text("Dr. John Miller - Aug 25, 2025")),
// //           const Divider(),
// //           const Text("Quick Actions"),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: const [
// //               Icon(Icons.receipt_long, size: 30),
// //               Icon(Icons.file_copy, size: 30),
// //               Icon(Icons.chat_bubble_outline, size: 30),
// //             ],
// //           ),
// //           const Divider(),
// //           const Text("Health Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: const [
// //               Chip(label: Text("Heart: 72 bpm")),
// //               Chip(label: Text("BP: 120/80")),
// //               Chip(label: Text("Meds: 3")),
// //               Chip(label: Text("Weight: 75 kg")),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Appointment Screen -----------------------------
// // class AppointmentScreen extends StatelessWidget {
// //   const AppointmentScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Available Slots", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           ListTile(
// //             title: const Text("Dr. Emily Watson"),
// //             subtitle: const Text("09:00 AM"),
// //             trailing: ElevatedButton(onPressed: () {}, child: const Text("Book Now")),
// //           ),
// //           ListTile(
// //             title: const Text("Dr. Sarah Lee"),
// //             subtitle: const Text("11:00 AM (Full)"),
// //             trailing: ElevatedButton(onPressed: () {}, child: const Text("Join Waitlist")),
// //           ),
// //           const Divider(),
// //           const Text("Need Urgent Consultation?", style: TextStyle(fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 10),
// //           ElevatedButton(onPressed: () {}, child: const Text("Start Video Consultation")),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Treatment Plan Screen -----------------------------
// // class TreatmentPlanScreen extends StatelessWidget {
// //   const TreatmentPlanScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           Text("Your Progress: 60%", style: TextStyle(fontWeight: FontWeight.bold)),
// //           SizedBox(height: 10),
// //           ListTile(title: Text("✔ Physiotherapy Sessions")),
// //           ListTile(title: Text("✔ Medication Adherence")),
// //           ListTile(title: Text("⏳ Follow-up Appointment")),
// //           Divider(),
// //           Text("Supplementary Guide"),
// //           SizedBox(height: 10),
// //           Text("🏠 Physiotherapy Exercises for Home"),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Medication Tracker -----------------------------
// // class MedicationTrackerScreen extends StatelessWidget {
// //   const MedicationTrackerScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           ListTile(
// //             title: Text("Metformin Hydrochloride"),
// //             subtitle: Text("500 mg, once daily at 8 AM"),
// //             trailing: Switch(value: true, onChanged: null),
// //           ),
// //           ListTile(
// //             title: Text("Lisinopril"),
// //             subtitle: Text("10 mg, daily at 9 AM"),
// //             trailing: Switch(value: false, onChanged: null),
// //           ),
// //           ListTile(
// //             title: Text("Atorvastatin"),
// //             subtitle: Text("20 mg, bedtime"),
// //             trailing: Switch(value: true, onChanged: null),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Messages & Alerts -----------------------------
// // class MessagesScreen extends StatelessWidget {
// //   const MessagesScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           ListTile(
// //             title: Text("You:"),
// //             subtitle: Text("Experiencing discomfort in my knee."),
// //           ),
// //           ListTile(
// //             title: Text("Doctor:"),
// //             subtitle: Text("Apply cold compress, book follow-up if needed."),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Digital Records -----------------------------
// // class RecordsScreen extends StatelessWidget {
// //   const RecordsScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           ListTile(
// //             title: Text("Amlodipine Besylate"),
// //             subtitle: Text("10mg daily • Refill Due"),
// //             trailing: Icon(Icons.download),
// //           ),
// //           ListTile(
// //             title: Text("Metformin Hydrochloride"),
// //             subtitle: Text("500mg twice daily • Viewed"),
// //             trailing: Icon(Icons.download),
// //           ),
// //           ListTile(
// //             title: Text("Simvastatin"),
// //             subtitle: Text("40mg bedtime • Shared"),
// //             trailing: Icon(Icons.download),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:hackto/screens/role_select.dart';
// // // import 'role_select_screen.dart';

// // class PatientHomeScreen extends StatefulWidget {
// //   final String pid;
// //   final String did;

// //   const PatientHomeScreen({super.key, required this.pid, required this.did});

// //   @override
// //   State<PatientHomeScreen> createState() => _PatientHomeScreenState();
// // }

// // class _PatientHomeScreenState extends State<PatientHomeScreen> {
// //   int _currentIndex = 0;

// //   final List<Widget> _screens = const [
// //     DashboardScreen(),
// //     AppointmentScreen(),
// //     TreatmentPlanScreen(),
// //     MedicationTrackerScreen(),
// //     MessagesScreen(),
// //     RecordsScreen(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text('Reuth Hospital'),
// //         backgroundColor: Colors.black,
// //         foregroundColor: Colors.white,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pushReplacement(
// //               context,
// //               MaterialPageRoute(builder: (_) => const RoleSelectScreen()),
// //             );
// //           },
// //         ),
// //       ),
// //       body: _screens[_currentIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: _currentIndex,
// //         type: BottomNavigationBarType.fixed,
// //         backgroundColor: Colors.black,
// //         selectedItemColor: Colors.red,
// //         unselectedItemColor: Colors.white70,
// //         onTap: (index) => setState(() => _currentIndex = index),
// //         items: const [
// //           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
// //           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
// //           BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Treatment'),
// //           BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Medication'),
// //           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
// //           BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Records'),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Dashboard Screen -----------------------------
// // class DashboardScreen extends StatelessWidget {
// //   const DashboardScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Treatment Timeline", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const ListTile(title: Text("Initial Assessment - Jan 15, 2024")),
// //           const ListTile(title: Text("Physical Therapy - Feb 1 to Mar 15")),
// //           const ListTile(title: Text("Medication Review - Mar 22, 2024")),
// //           const ListTile(title: Text("Follow-up Consultation - Apr 5, 2024")),
// //           const Divider(),
// //           const Text("Upcoming Appointments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const ListTile(title: Text("Dr. Emily White - Aug 23, 2025")),
// //           const ListTile(title: Text("Dr. John Miller - Aug 25, 2025")),
// //           const Divider(),
// //           const Text("Quick Actions"),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: const [
// //               Icon(Icons.receipt_long, size: 30, color: Colors.red),
// //               Icon(Icons.file_copy, size: 30, color: Colors.black),
// //               Icon(Icons.chat_bubble_outline, size: 30, color: Colors.black),
// //             ],
// //           ),
// //           const Divider(),
// //           const Text("Health Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: const [
// //               Chip(label: Text("Heart: 72 bpm")),
// //               Chip(label: Text("BP: 120/80")),
// //               Chip(label: Text("Meds: 3")),
// //               Chip(label: Text("Weight: 75 kg")),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Appointment Screen -----------------------------
// // class AppointmentScreen extends StatelessWidget {
// //   const AppointmentScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Available Slots", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           ListTile(
// //             title: const Text("Dr. Emily Watson"),
// //             subtitle: const Text("09:00 AM"),
// //             trailing: ElevatedButton(
// //               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
// //               onPressed: () {},
// //               child: const Text("Book Now"),
// //             ),
// //           ),
// //           ListTile(
// //             title: const Text("Dr. Sarah Lee"),
// //             subtitle: const Text("11:00 AM (Full)"),
// //             trailing: ElevatedButton(
// //               style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
// //               onPressed: () {},
// //               child: const Text("Join Waitlist", style: TextStyle(color: Colors.white)),
// //             ),
// //           ),
// //           const Divider(),
// //           const Text("Need Urgent Consultation?", style: TextStyle(fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 10),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
// //             onPressed: () {},
// //             child: const Text("Start Video Consultation"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Treatment Plan Screen -----------------------------
// // class TreatmentPlanScreen extends StatelessWidget {
// //   const TreatmentPlanScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           Text("Your Progress: 60%", style: TextStyle(fontWeight: FontWeight.bold)),
// //           SizedBox(height: 10),
// //           ListTile(title: Text("✔ Physiotherapy Sessions")),
// //           ListTile(title: Text("✔ Medication Adherence")),
// //           ListTile(title: Text("⏳ Follow-up Appointment")),
// //           Divider(),
// //           Text("Supplementary Guide"),
// //           SizedBox(height: 10),
// //           Text("🏠 Physiotherapy Exercises for Home"),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Medication Tracker -----------------------------
// // class MedicationTrackerScreen extends StatelessWidget {
// //   const MedicationTrackerScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           ListTile(
// //             title: Text("Metformin Hydrochloride"),
// //             subtitle: Text("500 mg, once daily at 8 AM"),
// //             trailing: Switch(value: true, onChanged: null),
// //           ),
// //           ListTile(
// //             title: Text("Lisinopril"),
// //             subtitle: Text("10 mg, daily at 9 AM"),
// //             trailing: Switch(value: false, onChanged: null),
// //           ),
// //           ListTile(
// //             title: Text("Atorvastatin"),
// //             subtitle: Text("20 mg, bedtime"),
// //             trailing: Switch(value: true, onChanged: null),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Messages & Alerts -----------------------------
// // class MessagesScreen extends StatelessWidget {
// //   const MessagesScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           ListTile(
// //             title: Text("You:"),
// //             subtitle: Text("Experiencing discomfort in my knee."),
// //           ),
// //           ListTile(
// //             title: Text("Doctor:"),
// //             subtitle: Text("Apply cold compress, book follow-up if needed."),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ----------------------------- Digital Records -----------------------------
// // class RecordsScreen extends StatelessWidget {
// //   const RecordsScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: const [
// //           ListTile(
// //             title: Text("Amlodipine Besylate"),
// //             subtitle: Text("10mg daily • Refill Due"),
// //             trailing: Icon(Icons.download),
// //           ),
// //           ListTile(
// //             title: Text("Metformin Hydrochloride"),
// //             subtitle: Text("500mg twice daily • Viewed"),
// //             trailing: Icon(Icons.download),
// //           ),
// //           ListTile(
// //             title: Text("Simvastatin"),
// //             subtitle: Text("40mg bedtime • Shared"),
// //             trailing: Icon(Icons.download),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:hackto/main.dart';
// // import 'package:hackto/screens/role_select.dart';

// // class PatientHomeScreen extends StatefulWidget {
// //   final String pid;
// //   final String did;

// //   const PatientHomeScreen({super.key, required this.pid, required this.did});

// //   @override
// //   State<PatientHomeScreen> createState() => _PatientHomeScreenState();
// // }

// // class _PatientHomeScreenState extends State<PatientHomeScreen> {
// //   int _currentIndex = 0;

// //   final List<Widget> _screens = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _screens.addAll([
// //       DashboardScreen(navigateTo: _navigateToScreen),
// //       const AppointmentScreen(),
// //       const TreatmentPlanScreen(),
// //       const MedicationTrackerScreen(),
// //       const ChatbotScreen(),
// //       const PrescriptionScreen(),
// //     ]);
// //   }

// //   void _navigateToScreen(int index) {
// //     setState(() {
// //       _currentIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text('Reuth Hospital'),
// //         backgroundColor: Colors.black,
// //         foregroundColor: Colors.white,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pushReplacement(
// //               context,
// //               MaterialPageRoute(builder: (_) => const RoleSelectScreen()),
// //             );
// //           },
// //         ),
// //       ),
// //       body: IndexedStack(
// //         index: _currentIndex,
// //         children: _screens,
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: _currentIndex,
// //         type: BottomNavigationBarType.fixed,
// //         backgroundColor: Colors.black,
// //         selectedItemColor: Colors.red,
// //         unselectedItemColor: Colors.white70,
// //         onTap: _navigateToScreen,
// //         items: const [
// //           BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
// //           BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
// //           BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Treatment'),
// //           BottomNavigationBarItem(icon: Icon(Icons.medication), label: 'Medication'),
// //           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chatbot'),
// //           BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: 'Prescription'),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------- DASHBOARD SCREEN ----------

// // class DashboardScreen extends StatelessWidget {
// //   final Function(int) navigateTo;
// //   const DashboardScreen({super.key, required this.navigateTo});

// //   Widget _buildTimelineTile(String text) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 6),
// //       padding: const EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         border: Border.all(color: Colors.grey.shade300),
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.05),
// //             blurRadius: 6,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Text(text, style: const TextStyle(fontSize: 16)),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Treatment Timeline", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 8),
// //           _buildTimelineTile("Initial Assessment - Jan 15, 2024"),
// //           _buildTimelineTile("Physical Therapy - Feb 1 to Mar 15"),
// //           _buildTimelineTile("Medication Review - Mar 22, 2024"),
// //           _buildTimelineTile("Follow-up Consultation - Apr 5, 2024"),
// //           const Divider(height: 32),
// //           const Text("Upcoming Appointments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 8),
// //           Card(
// //             elevation: 4,
// //             shadowColor: Colors.black12,
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             child: Column(
// //               children: const [
// //                 ListTile(title: Text("Dr. Emily White - Aug 23, 2025")),
// //                 Divider(height: 1),
// //                 ListTile(title: Text("Dr. John Miller - Aug 25, 2025")),
// //               ],
// //             ),
// //           ),
// //           const Divider(height: 32),
// //           const Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 8),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               OutlinedButton(
// //                 style: OutlinedButton.styleFrom(
// //                   backgroundColor: const Color(0xFFF5F5F5),
// //                   side: const BorderSide(color: Colors.red, width: 2),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// //                   elevation: 0,
// //                 ),
// //                 onPressed: () => navigateTo(1),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: const [
// //                     Icon(Icons.receipt_long, size: 20, color: Colors.red),
// //                     SizedBox(height: 4),
// //                     Text("Appointments", style: TextStyle(fontSize: 12, color: Colors.red)),
// //                   ],
// //                 ),
// //               ),
// //               OutlinedButton(
// //                 style: OutlinedButton.styleFrom(
// //                   backgroundColor: const Color(0xFFF5F5F5),
// //                   side: const BorderSide(color: Colors.red, width: 2),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// //                   elevation: 0,
// //                 ),
// //                 onPressed: () => navigateTo(5),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: const [
// //                     Icon(Icons.file_copy, size: 20, color: Colors.red),
// //                     SizedBox(height: 4),
// //                     Text("Prescriptions", style: TextStyle(fontSize: 12, color: Colors.red)),
// //                   ],
// //                 ),
// //               ),
// //               OutlinedButton(
// //                 style: OutlinedButton.styleFrom(
// //                   backgroundColor: const Color(0xFFF5F5F5),
// //                   side: const BorderSide(color: Colors.red, width: 2),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// //                   elevation: 0,
// //                 ),
// //                 onPressed: () => navigateTo(4),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: const [
// //                     Icon(Icons.chat_bubble_outline, size: 20, color: Colors.red),
// //                     SizedBox(height: 4),
// //                     Text("Chatbot", style: TextStyle(fontSize: 12, color: Colors.red)),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const Divider(height: 32),
// //           const Text("Health Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 8),
// //           Wrap(
// //             spacing: 10,
// //             runSpacing: 8,
// //             children: [
// //               Chip(
// //                 backgroundColor: const Color(0xFFF8F8F8),
// //                 label: const Text("Heart: 72 bpm", style: TextStyle(color: Colors.black87)),
// //               ),
// //               Chip(
// //                 backgroundColor: const Color(0xFFF8F8F8),
// //                 label: const Text("BP: 120/80", style: TextStyle(color: Colors.black87)),
// //               ),
// //               Chip(
// //                 backgroundColor: const Color(0xFFF8F8F8),
// //                 label: const Text("Meds: 3", style: TextStyle(color: Colors.black87)),
// //               ),
// //               Chip(
// //                 backgroundColor: const Color(0xFFF8F8F8),
// //                 label: const Text("Weight: 75 kg", style: TextStyle(color: Colors.black87)),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------- TREATMENT PLAN SCREEN ----------

// // class TreatmentPlanScreen extends StatelessWidget {
// //   const TreatmentPlanScreen({super.key});

// //   Widget _buildPlanItem(String text, {bool completed = false}) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 6),
// //       padding: const EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         border: Border.all(color: Colors.grey.shade300),
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.05),
// //             blurRadius: 6,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           Icon(
// //             completed ? Icons.check_circle : Icons.hourglass_bottom,
// //             color: completed ? Colors.green : Colors.orange,
// //           ),
// //           const SizedBox(width: 12),
// //           Text(text, style: const TextStyle(fontSize: 16)),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Your Progress: 60%", style: TextStyle(fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 12),
// //           _buildPlanItem("Physiotherapy Sessions", completed: true),
// //           _buildPlanItem("Medication Adherence", completed: true),
// //           _buildPlanItem("Follow-up Appointment", completed: false),
// //           const Divider(height: 32),
// //           const Text("Supplementary Guide"),
// //           const SizedBox(height: 10),
// //           Container(
// //             padding: const EdgeInsets.all(12),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               border: Border.all(color: Colors.grey.shade300),
// //               borderRadius: BorderRadius.circular(12),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black.withOpacity(0.05),
// //                   blurRadius: 6,
// //                   offset: const Offset(0, 3),
// //                 ),
// //               ],
// //             ),
// //             child: const Text("🏠 Physiotherapy Exercises for Home", style: TextStyle(fontSize: 16)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------- CHATBOT SCREEN ----------

// // class ChatbotScreen extends StatefulWidget {
// //   const ChatbotScreen({super.key});

// //   @override
// //   State<ChatbotScreen> createState() => _ChatbotScreenState();
// // }

// // class _ChatbotScreenState extends State<ChatbotScreen> {
// //   final List<_Message> _messages = [
// //     _Message(text: "Experiencing discomfort in my knee.", isUser: true, time: "10:45 AM"),
// //     _Message(text: "Apply cold compress, book follow-up if needed.", isUser: false, time: "10:47 AM"),
// //   ];

// //   final TextEditingController _controller = TextEditingController();

// //   void _sendMessage() {
// //     final text = _controller.text.trim();
// //     if (text.isEmpty) return;
// //     setState(() {
// //       _messages.add(_Message(text: text, isUser: true, time: _formattedTime()));
// //       // Example bot reply - you can replace with real logic
// //       _messages.add(_Message(text: "Thank you for your message, we will get back to you shortly.", isUser: false, time: _formattedTime()));
// //     });
// //     _controller.clear();
// //   }

// //   String _formattedTime() {
// //     final now = DateTime.now();
// //     final hour = now.hour > 12 ? now.hour - 12 : now.hour;
// //     final ampm = now.hour >= 12 ? "PM" : "AM";
// //     final minute = now.minute.toString().padLeft(2, '0');
// //     return "$hour:$minute $ampm";
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               padding: const EdgeInsets.all(16),
// //               itemCount: _messages.length,
// //               itemBuilder: (context, index) {
// //                 final msg = _messages[index];
// //                 return Align(
// //                   alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
// //                   child: ChatBubble(
// //                     text: msg.text,
// //                     isUser: msg.isUser,
// //                     time: msg.time,
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //           Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// //             decoration: BoxDecoration(
// //               color: Colors.grey.shade100,
// //               border: Border(top: BorderSide(color: Colors.grey.shade300)),
// //             ),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _controller,
// //                     decoration: const InputDecoration(
// //                       hintText: "Type a message...",
// //                       border: InputBorder.none,
// //                     ),
// //                     minLines: 1,
// //                     maxLines: 5,
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.send, color: Colors.red),
// //                   onPressed: _sendMessage,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _Message {
// //   final String text;
// //   final bool isUser;
// //   final String time;

// //   _Message({required this.text, required this.isUser, required this.time});
// // }

// // class ChatBubble extends StatelessWidget {
// //   final String text;
// //   final bool isUser;
// //   final String time;
// //   const ChatBubble({required this.text, required this.isUser, required this.time, super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final bgColor = isUser ? Colors.red[100] : Colors.grey[200];
// //     final align = isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
// //     final borderRadius = isUser
// //         ? const BorderRadius.only(
// //             topLeft: Radius.circular(14),
// //             topRight: Radius.circular(14),
// //             bottomLeft: Radius.circular(14),
// //           )
// //         : const BorderRadius.only(
// //             topLeft: Radius.circular(14),
// //             topRight: Radius.circular(14),
// //             bottomRight: Radius.circular(14),
// //           );

// //     return Column(
// //       crossAxisAlignment: align,
// //       children: [
// //         Container(
// //           constraints: const BoxConstraints(maxWidth: 280),
// //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //           decoration: BoxDecoration(
// //             color: bgColor,
// //             borderRadius: borderRadius,
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black12,
// //                 blurRadius: 8,
// //                 offset: const Offset(0, 2),
// //               ),
// //             ],
// //             border: Border.all(color: Colors.grey[300]!),
// //           ),
// //           child: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               if (!isUser) ...[
// //                 CircleAvatar(
// //                   backgroundColor: Colors.grey[400],
// //                   child: const Icon(Icons.medical_services, color: Colors.white),
// //                   radius: 14,
// //                 ),
// //                 const SizedBox(width: 8),
// //               ],
// //               Flexible(child: Text(text, style: const TextStyle(fontSize: 14))),
// //               if (isUser) ...[
// //                 const SizedBox(width: 8),
// //                 CircleAvatar(
// //                   backgroundColor: Colors.red[300],
// //                   child: const Icon(Icons.person, color: Colors.white),
// //                   radius: 14,
// //                 ),
// //               ],
// //             ],
// //           ),
// //         ),
// //         const SizedBox(height: 4),
// //         Text(
// //           time,
// //           style: const TextStyle(fontSize: 10, color: Colors.grey),
// //         ),
// //       ],
// //     );
// //   }
// // }

// // // ---------- PRESCRIPTION SCREEN ----------

// // class PrescriptionScreen extends StatelessWidget {
// //   const PrescriptionScreen({super.key});

// //   Widget _buildPrescriptionCard(String title, String subtitle) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 8),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         border: Border.all(color: Colors.grey.shade300),
// //         borderRadius: BorderRadius.circular(14),
// //         boxShadow: [
// //           BoxShadow(
// //             color: const Color(0xFFFAFAFA), // off-white subtle shadow
// //             blurRadius: 10,
// //             offset: const Offset(0, 6),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
// //           const SizedBox(height: 6),
// //           Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           _buildPrescriptionCard("Amlodipine Besylate", "10mg daily • Refill Due"),
// //           _buildPrescriptionCard("Metformin Hydrochloride", "500mg twice daily • Viewed"),
// //           _buildPrescriptionCard("Simvastatin", "40mg bedtime • Shared"),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------- APPOINTMENT SCREEN ----------

// // class AppointmentScreen extends StatelessWidget {
// //   const AppointmentScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: [
// //           const Text("Available Slots", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           const SizedBox(height: 8),
// //           Card(
// //             elevation: 3,
// //             shadowColor: const Color(0x1A000000), // subtle black shadow 10%
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             child: ListTile(
// //               title: const Text("Dr. Emily Watson"),
// //               subtitle: const Text("09:00 AM"),
// //               trailing: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.red,
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                   elevation: 0,
// //                 ),
// //                 onPressed: () {},
// //                 child: const Text("Book Now", style: TextStyle(fontWeight: FontWeight.w600)),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 12),
// //           Card(
// //             elevation: 3,
// //             shadowColor: const Color(0x1A000000),
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             child: ListTile(
// //               title: const Text("Dr. Sarah Lee"),
// //               subtitle: const Text("11:00 AM (Full)"),
// //               trailing: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: Colors.black,
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                   elevation: 0,
// //                 ),
// //                 onPressed: () {},
// //                 child: const Text("Join Waitlist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------- MEDICATION TRACKER SCREEN ----------

// // class MedicationTrackerScreen extends StatefulWidget {
// //   const MedicationTrackerScreen({super.key});

// //   @override
// //   State<MedicationTrackerScreen> createState() => _MedicationTrackerScreenState();
// // }

// // class _MedicationTrackerScreenState extends State<MedicationTrackerScreen> {
// //   Map<String, bool> medStatus = {
// //     "Metformin Hydrochloride": true,
// //     "Lisinopril": false,
// //     "Atorvastatin": true,
// //   };

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: ListView(
// //         padding: const EdgeInsets.all(16),
// //         children: medStatus.keys.map((med) {
// //           return Card(
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             elevation: 3,
// //             shadowColor: Colors.black12,
// //             margin: const EdgeInsets.symmetric(vertical: 8),
// //             child: ListTile(
// //               title: Text(med),
// //               subtitle: const Text("Tap toggle to mark as taken"),
// //               trailing: Switch(
// //                 value: medStatus[med]!,
// //                 onChanged: (val) {
// //                   setState(() => medStatus[med] = val);
// //                 },
// //               ),
// //             ),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hackto/main.dart';
// import 'package:hackto/screens/role_select.dart';
// import 'package:hackto/data/repo.dart';

// class PatientHomeScreen extends StatefulWidget {
//   final String pid;
//   final String did;

//   const PatientHomeScreen({super.key, required this.pid, required this.did});

//   @override
//   State<PatientHomeScreen> createState() => _PatientHomeScreenState();
// }

// class _PatientHomeScreenState extends State<PatientHomeScreen> {
//   int _currentIndex = 0;
//   final List<Widget> _screens = [];

//   @override
//   void initState() {
//     super.initState();
//     _screens.addAll([
//       DashboardScreen(navigateTo: _navigateToScreen),
//       const AppointmentScreen(),
//       const TreatmentPlanScreen(),
//       MedicationTrackerScreen(pid: widget.pid),
//       const ChatbotScreen(),
//       PrescriptionScreen(pid: widget.pid),
//     ]);
//   }

//   void _navigateToScreen(int index) {
//     setState(() => _currentIndex = index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Reuth Hospital'),
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (_) => const MyApp()),
//             );
//           },
//         ),
//       ),
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.white70,
//         onTap: _navigateToScreen,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.dashboard), label: 'Dashboard'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.calendar_today), label: 'Appointments'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.healing), label: 'Treatment'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.medication), label: 'Medication'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chatbot'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.file_copy), label: 'Prescription'),
//         ],
//       ),
//     );
//   }
// }

// // ---------- DASHBOARD SCREEN ----------
// class DashboardScreen extends StatelessWidget {
//   final Function(int) navigateTo;
//   const DashboardScreen({super.key, required this.navigateTo});

//   Widget _buildTimelineTile(String text) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Text(text, style: const TextStyle(fontSize: 16)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const Text("Treatment Timeline",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           _buildTimelineTile("Initial Assessment - Jan 15, 2024"),
//           _buildTimelineTile("Physical Therapy - Feb 1 to Mar 15"),
//           _buildTimelineTile("Medication Review - Mar 22, 2024"),
//           _buildTimelineTile("Follow-up Consultation - Apr 5, 2024"),
//           const Divider(height: 32),
//           const Text("Upcoming Appointments",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           Card(
//             elevation: 4,
//             shadowColor: Colors.black12,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             child: Column(
//               children: const [
//                 ListTile(title: Text("Dr. Emily White - Aug 23, 2025")),
//                 Divider(height: 1),
//                 ListTile(title: Text("Dr. John Miller - Aug 25, 2025")),
//               ],
//             ),
//           ),
//           const Divider(height: 32),
//           const Text("Quick Actions",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               OutlinedButton(
//                 onPressed: () => navigateTo(1),
//                 child: const Text("Appointments"),
//               ),
//               OutlinedButton(
//                 onPressed: () => navigateTo(5),
//                 child: const Text("Prescriptions"),
//               ),
//               OutlinedButton(
//                 onPressed: () => navigateTo(4),
//                 child: const Text("Chatbot"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ---------- TREATMENT PLAN SCREEN ----------
// class TreatmentPlanScreen extends StatelessWidget {
//   const TreatmentPlanScreen({super.key});

//   Widget _buildPlanItem(String text, {bool completed = false}) {
//     return ListTile(
//       leading: Icon(completed ? Icons.check_circle : Icons.hourglass_bottom,
//           color: completed ? Colors.green : Colors.orange),
//       title: Text(text),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         const Text("Your Progress: 60%",
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 12),
//         _buildPlanItem("Physiotherapy Sessions", completed: true),
//         _buildPlanItem("Medication Adherence", completed: true),
//         _buildPlanItem("Follow-up Appointment", completed: false),
//       ],
//     );
//   }
// }

// // ---------- CHATBOT SCREEN ----------
// class ChatbotScreen extends StatelessWidget {
//   const ChatbotScreen({super.key});
//   @override
//   Widget build(BuildContext context) =>
//       const Center(child: Text("Chatbot Placeholder"));
// }

// // ---------- PRESCRIPTION SCREEN ----------
// class PrescriptionScreen extends StatelessWidget {
//   final String pid;
//   const PrescriptionScreen({super.key, required this.pid});

//   @override
//   Widget build(BuildContext context) {
//     final patient = repo.getPatient(pid);
//     if (patient == null) {
//       return const Center(child: Text("No patient found"));
//     }
//     final prescriptions = patient.prescriptions;

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: prescriptions.length,
//       itemBuilder: (context, i) {
//         final presc = prescriptions[i];
//         return Card(
//           margin: const EdgeInsets.symmetric(vertical: 8),
//           child: ExpansionTile(
//             title: Text("Prescription ${i + 1}"),
//             children: [
//               ListTile(
//                 title: Text(presc.name),
//                 subtitle: Text("${presc.dose} • ${presc.frequency}"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// // ---------- APPOINTMENT SCREEN ----------
// class AppointmentScreen extends StatelessWidget {
//   const AppointmentScreen({super.key});
//   @override
//   Widget build(BuildContext context) =>
//       const Center(child: Text("Appointment Screen Placeholder"));
// }

// // ---------- MEDICATION TRACKER SCREEN ----------
// class MedicationTrackerScreen extends StatefulWidget {
//   final String pid;
//   const MedicationTrackerScreen({super.key, required this.pid});

//   @override
//   State<MedicationTrackerScreen> createState() =>
//       _MedicationTrackerScreenState();
// }

// class _MedicationTrackerScreenState extends State<MedicationTrackerScreen> {
//   final Map<String, bool> medStatus = {};

//   @override
//   @override
//   void initState() {
//     super.initState();
//     final patient = repo.getPatient(widget.pid);
//     if (patient != null) {
//       for (var presc in patient.prescriptions) {
//         medStatus[presc.name] = false; // default unchecked
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (medStatus.isEmpty) {
//       return const Center(child: Text("No medications found"));
//     }
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: medStatus.keys.map((med) {
//         return Card(
//           child: ListTile(
//             title: Text(med),
//             subtitle: const Text("Tap toggle to mark as taken"),
//             trailing: Switch(
//               value: medStatus[med]!,
//               onChanged: (val) {
//                 setState(() => medStatus[med] = val);
//               },
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hackto/data/repo.dart';
import 'package:hackto/main.dart';

// ---------------- PATIENT HOME ----------------
class PatientHomeScreen extends StatefulWidget {
  final String patientId;
  final String doctorId;

  const PatientHomeScreen(
      {super.key, required this.patientId, required this.doctorId});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      DashboardScreen(navigateTo: _navigateToScreen),
      const AppointmentScreen(),
      const TreatmentPlanScreen(),
      MedicationTrackerScreen(pid: widget.patientId),
      const ChatbotScreen(),
      PrescriptionScreen(pid: widget.patientId),
    ]);
  }

  void _navigateToScreen(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reuth Hospital'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MyApp()),
            );
          },
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white70,
        onTap: _navigateToScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.healing), label: 'Treatment'),
          BottomNavigationBarItem(
              icon: Icon(Icons.medication), label: 'Medication'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chatbot'),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy), label: 'Prescription'),
        ],
      ),
    );
  }
}

// ---------- DASHBOARD ----------
class DashboardScreen extends StatelessWidget {
  final Function(int) navigateTo;
  const DashboardScreen({super.key, required this.navigateTo});

  Widget _buildTimelineTile(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Treatment Timeline",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildTimelineTile("Initial Assessment - Jan 15, 2024"),
          _buildTimelineTile("Physical Therapy - Feb 1 to Mar 15"),
          _buildTimelineTile("Medication Review - Mar 22, 2024"),
          _buildTimelineTile("Follow-up Consultation - Apr 5, 2024"),
          const Divider(height: 32),
          const Text("Upcoming Appointments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Card(
            elevation: 4,
            shadowColor: Colors.black12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: const [
                ListTile(title: Text("Dr. Emily White - Aug 23, 2025")),
                Divider(height: 1),
                ListTile(title: Text("Dr. John Miller - Aug 25, 2025")),
              ],
            ),
          ),
          const Divider(height: 32),
          const Text("Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => navigateTo(1),
                child: const Text("Appointments"),
              ),
              OutlinedButton(
                onPressed: () => navigateTo(5),
                child: const Text("Prescriptions"),
              ),
              OutlinedButton(
                onPressed: () => navigateTo(4),
                child: const Text("Chatbot"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------- TREATMENT ----------
class TreatmentPlanScreen extends StatelessWidget {
  const TreatmentPlanScreen({super.key});

  Widget _buildPlanItem(String text, {bool completed = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check_circle : Icons.hourglass_bottom,
            color: completed ? Colors.green : Colors.orange,
          ),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Your Progress: 60%",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildPlanItem("Physiotherapy Sessions", completed: true),
          _buildPlanItem("Medication Adherence", completed: true),
          _buildPlanItem("Follow-up Appointment", completed: false),
          const Divider(height: 32),
          const Text("Supplementary Guide"),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Text("🏠 Physiotherapy Exercises for Home",
                style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}

// ---------- CHATBOT ----------
class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Chatbot Placeholder"));
}

// ---------- PRESCRIPTIONS ----------
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

// ---------- APPOINTMENTS ----------
class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text("Appointment Screen Placeholder"));
}

// ---------- MEDICATION TRACKER ----------
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
