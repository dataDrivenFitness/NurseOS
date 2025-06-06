import 'package:flutter/material.dart';
import 'package:nurse_os/models/care_plan_model.dart';

/// Renders a single care plan in a styled card.
class CarePlanCardWidget extends StatelessWidget {
  final CarePlanModel carePlan;

  const CarePlanCardWidget({super.key, required this.carePlan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Problem: ${carePlan.problem}', style: Theme.of(context).textTheme.titleMedium),
            Text('Goal: ${carePlan.goal}'),
            Text('Intervention: ${carePlan.intervention}'),
            Text('Evaluation: ${carePlan.evaluation}'),
            const SizedBox(height: 6),
            Text('Created: ${carePlan.createdAt.toLocal().toString().split(' ')[0]}', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
