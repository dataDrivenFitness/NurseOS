import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/care_plan_provider.dart';
import '../models/care_plan_model.dart';
import 'care_plan_detail_screen.dart';

class CarePlanScreen extends ConsumerWidget {
  final String patientId;
  const CarePlanScreen({super.key, required this.patientId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carePlansAsync = ref.watch(carePlansProvider(patientId));

    return Scaffold(
      appBar: AppBar(title: const Text('Care Plans')),
      body: carePlansAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (plans) => ListView.separated(
          padding: const EdgeInsets.all(12),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: plans.length,
          itemBuilder: (_, i) => _CarePlanCard(plan: plans[i]),
        ),
      ),
    );
  }
}

class _CarePlanCard extends StatelessWidget {
  final CarePlanModel plan;
  const _CarePlanCard({required this.plan});

  @override
  Widget build(BuildContext context) {
    final isOngoing = plan.endDate == null;
    final dateRange = isOngoing
        ? 'Ongoing'
        : '${plan.startDate.toLocal().toIso8601String().split('T').first} → ${plan.endDate!.toLocal().toIso8601String().split('T').first}';

    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CarePlanDetailScreen(carePlan: plan)),
        );
      },
      child: Card(
        color: color.surfaceVariant,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(plan.title, style: theme.textTheme.titleMedium),
              const SizedBox(height: 6),
              Text(plan.description, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 10),
              Row(
                children: [
                  _Tag(text: isOngoing ? 'Ongoing' : 'Scheduled'),
                  const SizedBox(width: 8),
                  _Tag(text: dateRange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: color.onPrimaryContainer),
      ),
    );
  }
}
