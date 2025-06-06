import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nurse_os/models/care_plan_model.dart';
import 'package:nurse_os/services/care_plan_service.dart';

/// Family provider to get care plans by patient ID.
final carePlansProvider = FutureProvider.family<List<CarePlanModel>, String>((ref, patientId) async {
  final service = CarePlanService();
  return service.fetchCarePlansByPatient(patientId);
});
