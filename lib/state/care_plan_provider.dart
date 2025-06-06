import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/care_plan_model.dart';
import '../services/care_plan_service.dart';

final carePlansProvider = FutureProvider.family<List<CarePlanModel>, String>((ref, patientId) {
  final service = CarePlanService();
  return service.fetchCarePlansForPatient(patientId);
});
