import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nurse_os/models/care_plan_model.dart';
import 'package:nurse_os/services/care_plan_service.dart';

/// Internal StateNotifier to manage mock care plans (in-memory list)
class CarePlanNotifier extends StateNotifier<AsyncValue<List<CarePlanModel>>> {
  final String patientId;
  final _mockData = <CarePlanModel>[]; // Used in mock mode only

  CarePlanNotifier(this.patientId) : super(const AsyncValue.loading()) {
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    // For now, mock-only loading using the service
    final service = CarePlanService();
    final plans = await service.fetchCarePlansByPatient(patientId);
    _mockData.clear();
    _mockData.addAll(plans);
    state = AsyncValue.data(_mockData);
  }

  void addMockPlan(CarePlanModel newPlan) {
    _mockData.add(newPlan);
    state = AsyncValue.data(List.from(_mockData));
  }
}

/// Family provider for care plans by patient ID (mock-capable)
final carePlansProvider = StateNotifierProvider.family<CarePlanNotifier, AsyncValue<List<CarePlanModel>>, String>(
  (ref, patientId) => CarePlanNotifier(patientId),
);
