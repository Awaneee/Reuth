import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorHomeScreen extends StatefulWidget {
  final String doctorId;
  const DoctorHomeScreen({super.key, required this.doctorId});
  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _tabIndex = 0;
  int selectedDayIndex = 0;

  List<DateTime> get next7Days {
    final now = DateTime.now();
    return List.generate(7, (i) => DateTime(now.year, now.month, now.day + i));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafe),
      appBar: AppBar(
        title: const Text('Doctor Dashboard',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: _tabIndex == 0 ? _dashboardTab() : _availabilityTab(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 64,
        selectedIndex: _tabIndex,
        onDestinationSelected: (i) => setState(() => _tabIndex = i),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(
              icon: Icon(Icons.calendar_today), label: 'Availability'),
        ],
      ),
    );
  }

  Widget _dashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _doctorHeader(),
          const SizedBox(height: 16),
          Row(
            children: [
              _quickAction(
                title: "Manage Availability",
                icon: Icons.calendar_today,
                subtitle: "Set your schedule",
                color: Colors.grey.shade100,
                onTap: () => setState(() => _tabIndex = 1),
              ),
              const SizedBox(width: 10),
              _quickAction(
                title: "My Patients",
                icon: Icons.people,
                subtitle: "View patient list",
                color: Colors.grey.shade100,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Coming soon: View patients")));
                },
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text("Today's Appointments",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          _todaysAppointments(),
          const SizedBox(height: 20),
          _statisticsRow(),
        ],
      ),
    );
  }

  Widget _doctorHeader() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('doctors')
          .doc(widget.doctorId)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(14)),
            child: const Text("Doctor not found",
                style: TextStyle(fontSize: 18, color: Colors.blue)),
          );
        }
        final data = snapshot.data!.data() as Map<String, dynamic>;
        final name = data['name'] ?? 'Doctor';
        final specialty = data['specialty'] ?? "Cardiology Specialist";
        return Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue)),
              const SizedBox(height: 6),
              Text(specialty,
                  style: const TextStyle(fontSize: 16, color: Colors.blueGrey)),
            ],
          ),
        );
      },
    );
  }

  Widget _quickAction(
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap,
      Color? color}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: color ?? Colors.blue.shade50,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.blue.shade700, size: 28),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 3),
              Text(subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _todaysAppointments() {
    DateTime now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = Timestamp.fromDate(today);
    final end = Timestamp.fromDate(today.add(const Duration(days: 1)));

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('doctors')
          .doc(widget.doctorId)
          .collection('appointments')
          .where('slot', isGreaterThanOrEqualTo: start)
          .where('slot', isLessThan: end)
          .orderBy('slot')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final docs = snapshot.data!.docs;
        if (docs.isEmpty) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 7),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12)),
            child: const Text("No appointments for today"),
          );
        }
        return Column(
          children: docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            final slot = (data['slot'] as Timestamp).toDate();
            final patient =
                data['patientName'] ?? data['patientId'] ?? 'Unknown';
            final note = data['note'] ?? 'Consultation';
            String t =
                "${slot.hour.toString().padLeft(2, '0')}:${slot.minute.toString().padLeft(2, '0')}";

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Icon(Icons.event_note, color: Colors.blue.shade400),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$patient - $t",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(note,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black54)),
                    ],
                  )),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _statisticsRow() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _stat(number: '12', label: 'Appointments'),
          _stat(number: '8', label: 'Patients'),
          _stat(number: '15', label: 'Prescriptions'),
        ],
      ),
    );
  }

  Widget _stat({required String number, required String label}) {
    return Column(
      children: [
        Text(number,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 22)),
        const SizedBox(height: 3),
        Text(label,
            style: const TextStyle(color: Colors.black87, fontSize: 13)),
      ],
    );
  }

  /// ✅ PRETTY/SCROLLABLE AVAILABILITY CALENDAR - fixed overflow
  Widget _availabilityTab() {
    final days = next7Days;
    final selectedDate = days[selectedDayIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 88,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            itemBuilder: (context, i) {
              final day = days[i];
              final isSelected = i == selectedDayIndex;
              return GestureDetector(
                onTap: () => setState(() => selectedDayIndex = i),
                child: Container(
                  width: 70,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected
                          ? Colors.blue.shade700
                          : Colors.blue.shade100,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        [
                          'SUN',
                          'MON',
                          'TUE',
                          'WED',
                          'THU',
                          'FRI',
                          'SAT'
                        ][day.weekday % 7],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${day.day}',
                        style: TextStyle(
                          fontSize: 22,
                          color: isSelected ? Colors.white : Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Mark available hours for selected day:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Set fixed height for the grid view to prevent overflow
        SizedBox(height: 220, child: _hourChooserForDay(selectedDate)),
        const SizedBox(height: 18),
      ],
    );
  }

  Widget _hourChooserForDay(DateTime date) {
    final slotHours = List<int>.generate(8, (i) => 9 + i);
    final slots = slotHours
        .map((h) => DateTime(date.year, date.month, date.day, h))
        .toList();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('doctors')
          .doc(widget.doctorId)
          .collection('unavailability')
          .snapshots(),
      builder: (context, snapshot) {
        final unavailableSlots = <String>{};
        if (snapshot.hasData) {
          for (var doc in snapshot.data!.docs) {
            final slotTimestamp = doc['slot'] as Timestamp;
            unavailableSlots.add(slotTimestamp.toDate().toIso8601String());
          }
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.3,
          ),
          padding: const EdgeInsets.all(14),
          itemCount: slots.length,
          itemBuilder: (context, i) {
            final slot = slots[i];
            final isUnavailable =
                unavailableSlots.contains(slot.toIso8601String());
            final slotLabel = "${slot.hour.toString().padLeft(2, '0')}:00";
            return GestureDetector(
              onTap: () async {
                final docRef = FirebaseFirestore.instance
                    .collection('doctors')
                    .doc(widget.doctorId)
                    .collection('unavailability')
                    .doc(slot.toIso8601String());
                if (isUnavailable) {
                  await docRef.delete();
                } else {
                  await docRef.set({'slot': Timestamp.fromDate(slot)});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isUnavailable ? Colors.red.shade200 : Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isUnavailable
                        ? Colors.red.shade300
                        : Colors.blue.shade100,
                    width: isUnavailable ? 2 : 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    slotLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isUnavailable
                          ? Colors.red.shade800
                          : Colors.blue.shade700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
