import '../models/care_plan_model.dart';

/// Abstract base for GPT services — allows swapping GPT/Claude/Mistral/etc.
abstract class GptServiceBase {
  Future<String> getRecommendations(CarePlanModel plan);
}

/// Stub implementation for Phase 5–7
class GptServiceStub implements GptServiceBase {
  @override
  Future<String> getRecommendations(CarePlanModel plan) async {
    // Simulate delay and return a fake response
    await Future.delayed(const Duration(seconds: 1));
    return '🧠 GPT would recommend monitoring vitals daily and reassessing plan weekly.';
  }
}
