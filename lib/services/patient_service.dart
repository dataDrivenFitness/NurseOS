import 'package:nurse_os/models/patient_model.dart';

/// Simulates fetching patient data from a backend or Firestore.
class PatientService {
  /// Mock list of patients
  Future<List<PatientModel>> fetchPatients() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate delay
    return [
      PatientModel(
        id: '1',
        name: 'John Doe',
        age: 68,
        roomNumber: '101A',
        diagnosis: 'CHF',
        admittedAt: DateTime.now().subtract(const Duration(days: 3)),
        createdBy: 'nurse_1',
      ),
      PatientModel(
        id: '2',
        name: 'Jane Smith',
        age: 74,
        roomNumber: '102B',
        diagnosis: 'Pneumonia',
        admittedAt: DateTime.now().subtract(const Duration(days: 1)),
        createdBy: 'nurse_1',
      ),
    ];
  }
}
