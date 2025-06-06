import '../models/care_plan_model.dart';

/// Mock service for fetching care plans
class CarePlanService {
  Future<List<CarePlanModel>> fetchCarePlansForPatient(String patientId) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    return [
      CarePlanModel(
        id: 'cp1',
        patientId: patientId,
        title: 'Post-Surgery Recovery',
        description: 'Monitor vitals and manage pain for 7 days.',
        startDate: DateTime.now().subtract(const Duration(days: 2)),
        endDate: DateTime.now().add(const Duration(days: 5)),
      ),
      CarePlanModel(
        id: 'cp2',
        patientId: patientId,
        title: 'Diabetes Management',
        description: 'Daily insulin and glucose monitoring.',
        startDate: DateTime.now().subtract(const Duration(days: 30)),
        endDate: null,
      ),
    ];
  }
}
