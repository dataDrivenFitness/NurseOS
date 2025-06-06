import 'package:flutter/material.dart';
import '../models/care_plan_model.dart';
import 'edit_care_plan_screen.dart';

class CarePlanDetailScreen extends StatefulWidget {
  final CarePlanModel carePlan;
  const CarePlanDetailScreen({super.key, required this.carePlan});

  @override
  State<CarePlanDetailScreen> createState() => _CarePlanDetailScreenState();
}

class _CarePlanDetailScreenState extends State<CarePlanDetailScreen> {
  late CarePlanModel plan;

  @override
  void initState() {
    super.initState();
    plan = widget.carePlan;
  }

  Future<void> _editPlan() async {
    final updated = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditCarePlanScreen(carePlan: plan)),
    );
    if (updated is CarePlanModel) {
      setState(() => plan = updated);
    }
  }

  Widget _section(String title, String content) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: theme.textTheme.labelSmall),
          const SizedBox(height: 4),
          Text(content, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final start = plan.startDate.toLocal().toIso8601String().split('T').first;
    final end = plan.endDate?.toLocal().toIso8601String().split('T').first ?? 'Ongoing';

    return Scaffold(
      appBar: AppBar(title: Text(plan.title)),
      backgroundColor: theme.colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: _editPlan,
        child: const Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _section('Description', plan.description),
              _section('Start Date', start),
              _section('End Date', end),
            ],
          ),
        ),
      ),
    );
  }
}
