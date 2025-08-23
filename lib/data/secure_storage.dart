import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Create storage instance
  static const _storage = FlutterSecureStorage();

  // Keys (you can add more if needed)
  static const String _keyUserRole = 'userRole';
  static const String _keyPatientId = 'patientId';
  static const String _keyDoctorId = 'doctorId';
  static const String _keyCaregiverId = 'caregiverId';

  /// Save user role (patient/doctor/caregiver)
  static Future<void> saveUserRole(String role) async {
    await _storage.write(key: _keyUserRole, value: role);
  }

  static Future<String?> getUserRole() async {
    return await _storage.read(key: _keyUserRole);
  }

  /// Save Patient ID
  static Future<void> savePatientId(String patientId) async {
    await _storage.write(key: _keyPatientId, value: patientId);
  }

  static Future<String?> getPatientId() async {
    return await _storage.read(key: _keyPatientId);
  }

  /// Save Doctor ID
  static Future<void> saveDoctorId(String doctorId) async {
    await _storage.write(key: _keyDoctorId, value: doctorId);
  }

  static Future<String?> getDoctorId() async {
    return await _storage.read(key: _keyDoctorId);
  }

  /// Save Caregiver ID
  static Future<void> saveCaregiverId(String caregiverId) async {
    await _storage.write(key: _keyCaregiverId, value: caregiverId);
  }

  static Future<String?> getCaregiverId() async {
    return await _storage.read(key: _keyCaregiverId);
  }

  /// Clear all stored values (for logout)
  static Future<void> clearStorage() async {
    await _storage.deleteAll();
  }
}
