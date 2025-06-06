import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/care_plan_model.dart';
import '../services/gpt_service.dart';

/// Notifier must extend FamilyAsyncNotifier<ReturnType, Argument>
class GptRecommendationNotifier extends FamilyAsyncNotifier<String, CarePlanModel> {
  @override
  Future<String> build(CarePlanModel plan) async {
    final service = GptServiceStub();
    return service.getRecommendations(plan);
  }
}

/// Correct type-safe provider declaration
final gptRecommendationProvider =
    AsyncNotifierProviderFamily<GptRecommendationNotifier, String, CarePlanModel>(
  GptRecommendationNotifier.new,
);
