import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nurse_os/models/patient_model.dart';
import 'package:nurse_os/services/patient_service.dart';

/// Provides access to patient data fetched from the service.
final patientListProvider = FutureProvider<List<PatientModel>>((ref) async {
  final service = PatientService();
  return service.fetchPatients();
});
