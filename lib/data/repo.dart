// import 'package:flutter/material.dart';

// class Prescription {
//   final String name;
//   final String dose;
//   final String frequency;
//   final List<TimeOfDay> reminders;
//   Prescription({required this.name, required this.dose, required this.frequency, required this.reminders});
// }
  
// class Appointment {
//   final String patientId;
//   final String doctorId;
//   final DateTime slot;
//   Appointment({required this.patientId, required this.doctorId, required this.slot});
// }

// class Patient {
//   final String id;
//   String name;
//   String doctorId;
//   List<Prescription> prescriptions = [];
//   List<Appointment> appointments = [];
//   Patient({required this.id, required this.name, required this.doctorId});
// }

// class Doctor {
//   final String id;
//   String name;
//   final Set<DateTime> unavailableSlots = {};
//   final List<Appointment> booked = [];
//   Doctor({required this.id, required this.name});
// }

// class AppRepository {
//   static final AppRepository _instance = AppRepository._internal();
//   factory AppRepository() => _instance;
//   AppRepository._internal() { _seed(); }

//   final Map<String, Patient> _patients = {};
//   final Map<String, Doctor> _doctors = {};

//   void _seed() {
//     _doctors['D100'] = Doctor(id: 'D100', name: 'Dr. Emily White');
//     _doctors['D200'] = Doctor(id: 'D200', name: 'Dr. John Miller');

//     final p1 = Patient(id: 'P001', name: 'Amit Kumar', doctorId: 'D100');
//     p1.prescriptions.add(Prescription(name: 'Metformin', dose: '500 mg', frequency: 'Twice Daily', reminders: const []));
//     _patients[p1.id] = p1;

//     final p2 = Patient(id: 'P002', name: 'Sara Khan', doctorId: 'D200');
//     _patients[p2.id] = p2;
//   }

//   Patient? getPatient(String id) => _patients[id];
//   Doctor? getDoctor(String id) => _doctors[id];
//   Iterable<Patient> get allPatients => _patients.values;
//   Iterable<Doctor> get allDoctors => _doctors.values;

//   List<DateTime> generateSlots({int days = 7}) {
//     final now = DateTime.now();
//     final start = DateTime(now.year, now.month, now.day, 9);
//     final out = <DateTime>[];
//     for (int d=0; d<days; d++) {
//       final day = DateTime(start.year, start.month, start.day + d);
//       for (int i=0;i<16;i++) {
//         out.add(DateTime(day.year, day.month, day.day, 9 + (i~/2), (i%2)*30));
//       }
//     }
//     return out;
//   }

//   void addPatient(Patient p) => _patients[p.id] = p;
//   void addPrescription(String pid, Prescription rx) {
//     final p = _patients[pid];
//     if (p != null) p.prescriptions.add(rx);
//   }

//   void book(String pid, String did, DateTime slot) {
//     final p = _patients[pid];
//     final d = _doctors[did];
//     if (p != null && d != null) {
//       final ap = Appointment(patientId: pid, doctorId: did, slot: slot);
//       p.appointments.add(ap);
//       d.booked.add(ap);
//     }
//   }

//   bool isBooked(String did, DateTime slot) {
//     final d = _doctors[did];
//     if (d==null) return false;
//     return d.booked.any((a) => _sameMinute(a.slot, slot));
//   }

//   void toggleUnavailable(String did, DateTime slot) {
//     final d = _doctors[did];
//     if (d==null) return;
//     if (d.unavailableSlots.any((s)=>_sameMinute(s,slot))) {
//       d.unavailableSlots.removeWhere((s)=>_sameMinute(s,slot));
//     } else {
//       d.unavailableSlots.add(slot);
//     }
//   }

//   bool isUnavailable(String did, DateTime slot) {
//     final d = _doctors[did];
//     if (d==null) return false;
//     return d.unavailableSlots.any((s)=>_sameMinute(s,slot));
//   }

//   bool _sameMinute(DateTime a, DateTime b) => a.year==b.year && a.month==b.month && a.day==b.day && a.hour==b.hour && a.minute==b.minute;
// }

// final repo = AppRepository();
// import 'package:flutter/material.dart';

// /// -------------------- PRESCRIPTION & MEDICATION --------------------
// class Prescription {
//   final String name;
//   final String dose;
//   final String frequency;
//   final List<TimeOfDay> reminders;

//   Prescription({
//     required this.name,
//     required this.dose,
//     required this.frequency,
//     required this.reminders,
//   });
// }

// class MedicationRecord {
//   final String prescriptionName;
//   final DateTime takenAt;

//   MedicationRecord({
//     required this.prescriptionName,
//     required this.takenAt,
//   });
// }

// /// -------------------- APPOINTMENTS --------------------
// class Appointment {
//   final String patientId;
//   final String doctorId;
//   final DateTime slot;

//   Appointment({
//     required this.patientId,
//     required this.doctorId,
//     required this.slot,
//   });
// }

// /// -------------------- PATIENT & DOCTOR --------------------
// class Patient {
//   final String id;
//   String name;
//   String doctorId;

//   List<Prescription> prescriptions = [];
//   List<Appointment> appointments = [];
//   List<MedicationRecord> medicationHistory = [];

//   Patient({
//     required this.id,
//     required this.name,
//     required this.doctorId,
//   });
// }

// class Doctor {
//   final String id;
//   String name;
//   final Set<DateTime> unavailableSlots = {};
//   final List<Appointment> booked = [];

//   Doctor({required this.id, required this.name});
// }

// /// -------------------- REPOSITORY --------------------
// class AppRepository {
//   static final AppRepository _instance = AppRepository._internal();
//   factory AppRepository() => _instance;
//   AppRepository._internal() {
//     _seed();
//   }

//   final Map<String, Patient> _patients = {};
//   final Map<String, Doctor> _doctors = {};

//   /// ---- Seed initial data ----
//   void _seed() {
//     _doctors['D100'] = Doctor(id: 'D100', name: 'Dr. Emily White');
//     _doctors['D200'] = Doctor(id: 'D200', name: 'Dr. John Miller');

//     final p1 = Patient(id: 'P001', name: 'Amit Kumar', doctorId: 'D100');
//     p1.prescriptions.add(
//       Prescription(
//         name: 'Metformin',
//         dose: '500 mg',
//         frequency: 'Twice Daily',
//         reminders: const [],
//       ),
//     );
//     _patients[p1.id] = p1;

//     final p2 = Patient(id: 'P002', name: 'Sara Khan', doctorId: 'D200');
//     _patients[p2.id] = p2;
//   }

//   /// ---- Getters ----
//   Patient? getPatient(String id) => _patients[id];
//   Doctor? getDoctor(String id) => _doctors[id];
//   Iterable<Patient> get allPatients => _patients.values;
//   Iterable<Doctor> get allDoctors => _doctors.values;

//   /// ---- Slots ----
//   List<DateTime> generateSlots({int days = 7}) {
//     final now = DateTime.now();
//     final start = DateTime(now.year, now.month, now.day, 9);
//     final out = <DateTime>[];
//     for (int d = 0; d < days; d++) {
//       final day = DateTime(start.year, start.month, start.day + d);
//       for (int i = 0; i < 16; i++) {
//         out.add(DateTime(day.year, day.month, day.day, 9 + (i ~/ 2), (i % 2) * 30));
//       }
//     }
//     return out;
//   }

//   /// ---- Patients ----
//   void addPatient(Patient p) => _patients[p.id] = p;

//   void addPrescription(String pid, Prescription rx) {
//     final p = _patients[pid];
//     if (p != null) p.prescriptions.add(rx);
//   }

//   void addMedicationRecord(String pid, MedicationRecord record) {
//     final p = _patients[pid];
//     if (p != null) p.medicationHistory.add(record);
//   }

//   List<MedicationRecord> getMedicationHistory(String pid) {
//     final p = _patients[pid];
//     return p?.medicationHistory ?? [];
//   }

//   /// ---- Appointments ----
//   void book(String pid, String did, DateTime slot) {
//     final p = _patients[pid];
//     final d = _doctors[did];
//     if (p != null && d != null) {
//       final ap = Appointment(patientId: pid, doctorId: did, slot: slot);
//       p.appointments.add(ap);
//       d.booked.add(ap);
//     }
//   }

//   bool isBooked(String did, DateTime slot) {
//     final d = _doctors[did];
//     if (d == null) return false;
//     return d.booked.any((a) => _sameMinute(a.slot, slot));
//   }

//   void toggleUnavailable(String did, DateTime slot) {
//     final d = _doctors[did];
//     if (d == null) return;
//     if (d.unavailableSlots.any((s) => _sameMinute(s, slot))) {
//       d.unavailableSlots.removeWhere((s) => _sameMinute(s, slot));
//     } else {
//       d.unavailableSlots.add(slot);
//     }
//   }

//   bool isUnavailable(String did, DateTime slot) {
//     final d = _doctors[did];
//     if (d == null) return false;
//     return d.unavailableSlots.any((s) => _sameMinute(s, slot));
//   }

//   /// ---- Helpers ----
//   bool _sameMinute(DateTime a, DateTime b) =>
//       a.year == b.year &&
//       a.month == b.month &&
//       a.day == b.day &&
//       a.hour == b.hour &&
//       a.minute == b.minute;
// }

// /// Global Repo Instance
// final repo = AppRepository();
import 'package:flutter/material.dart';

/// -------------------- PRESCRIPTION & MEDICATION --------------------
class Prescription {
  final String name;
  final String dose;
  final String frequency;
  final List<TimeOfDay> reminders;

  Prescription({
    required this.name,
    required this.dose,
    required this.frequency,
    required this.reminders,
  });
}

class MedicationRecord {
  final String prescriptionName;
  final DateTime takenAt;

  MedicationRecord({
    required this.prescriptionName,
    required this.takenAt,
  });
}

/// -------------------- APPOINTMENTS --------------------
class Appointment {
  final String patientId;
  final String doctorId;
  final DateTime slot;

  Appointment({
    required this.patientId,
    required this.doctorId,
    required this.slot,
  });
}

/// -------------------- PATIENT & DOCTOR --------------------
class Patient {
  final String id;
  String name;
  String doctorId;

  List<Prescription> prescriptions = [];
  List<Appointment> appointments = [];
  List<MedicationRecord> medicationHistory = [];

  Patient({
    required this.id,
    required this.name,
    required this.doctorId,
  });
}

class Doctor {
  final String id;
  String name;
  final Set<DateTime> unavailableSlots = {};
  final List<Appointment> booked = [];

  Doctor({required this.id, required this.name});
}

/// -------------------- REPOSITORY --------------------
class AppRepository {
  static final AppRepository _instance = AppRepository._internal();
  factory AppRepository() => _instance;
  AppRepository._internal() {
    _seed();
  }

  final Map<String, Patient> _patients = {};
  final Map<String, Doctor> _doctors = {};

  /// ---- Seed initial data ----
  void _seed() {
    _doctors['D100'] = Doctor(id: 'D100', name: 'Dr. Emily White');
    _doctors['D200'] = Doctor(id: 'D200', name: 'Dr. John Miller');

    final p1 = Patient(id: 'P001', name: 'Amit Kumar', doctorId: 'D100');
    p1.prescriptions.add(
      Prescription(
        name: 'Metformin',
        dose: '500 mg',
        frequency: 'Twice Daily',
        reminders: const [],
      ),
    );
    _patients[p1.id] = p1;

    final p2 = Patient(id: 'P002', name: 'Sara Khan', doctorId: 'D200');
    _patients[p2.id] = p2;
  }

  /// ---- Getters ----
  Patient? getPatient(String id) => _patients[id];
  Doctor? getDoctor(String id) => _doctors[id];
  Iterable<Patient> get allPatients => _patients.values;
  Iterable<Doctor> get allDoctors => _doctors.values;

  /// ---- Mutators ----
  void addPatient(Patient p) => _patients[p.id] = p;

  // ✅ Allow adding a doctor dynamically (used by CaregiverHome)
  void addDoctor(Doctor d) => _doctors[d.id] = d;

  void addPrescription(String pid, Prescription rx) {
    final p = _patients[pid];
    if (p != null) p.prescriptions.add(rx);
  }

  void addMedicationRecord(String pid, MedicationRecord record) {
    final p = _patients[pid];
    if (p != null) p.medicationHistory.add(record);
  }

  List<MedicationRecord> getMedicationHistory(String pid) {
    final p = _patients[pid];
    return p?.medicationHistory ?? [];
  }

  /// ✅ Simple auth helper for your login screen
  bool authenticatePatient(String pid, String did) {
    final p = _patients[pid];
    return p != null && p.doctorId == did;
  }

  /// ---- Slots ----
  List<DateTime> generateSlots({int days = 7}) {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day, 9);
    final out = <DateTime>[];
    for (int d = 0; d < days; d++) {
      final day = DateTime(start.year, start.month, start.day + d);
      for (int i = 0; i < 16; i++) {
        out.add(DateTime(
          day.year,
          day.month,
          day.day,
          9 + (i ~/ 2),
          (i % 2) * 30,
        ));
      }
    }
    return out;
  }

  /// ---- Appointments ----
  void book(String pid, String did, DateTime slot) {
    final p = _patients[pid];
    final d = _doctors[did];
    if (p != null && d != null) {
      final ap = Appointment(patientId: pid, doctorId: did, slot: slot);
      p.appointments.add(ap);
      d.booked.add(ap);
    }
  }

  bool isBooked(String did, DateTime slot) {
    final d = _doctors[did];
    if (d == null) return false;
    return d.booked.any((a) => _sameMinute(a.slot, slot));
  }

  void toggleUnavailable(String did, DateTime slot) {
    final d = _doctors[did];
    if (d == null) return;
    if (d.unavailableSlots.any((s) => _sameMinute(s, slot))) {
      d.unavailableSlots.removeWhere((s) => _sameMinute(s, slot));
    } else {
      d.unavailableSlots.add(slot);
    }
  }

  bool isUnavailable(String did, DateTime slot) {
    final d = _doctors[did];
    if (d == null) return false;
    return d.unavailableSlots.any((s) => _sameMinute(s, slot));
  }

  /// ---- Helpers ----
  bool _sameMinute(DateTime a, DateTime b) =>
      a.year == b.year &&
      a.month == b.month &&
      a.day == b.day &&
      a.hour == b.hour &&
      a.minute == b.minute;
}

/// Global Repo Instance
final repo = AppRepository();
