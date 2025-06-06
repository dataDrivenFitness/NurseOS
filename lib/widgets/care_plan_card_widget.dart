import 'package:flutter/material.dart';
import '../models/care_plan_model.dart';
import '../screens/care_plan_detail_screen.dart';

class CarePlanCardWidget extends StatelessWidget {
  final CarePlanModel carePlan;
  const CarePlanCardWidget({super.key, required this.carePlan});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(carePlan.title),
        subtitle: Text(carePlan.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CarePlanDetailScreen(carePlan: carePlan),
            ),
          );
        },
      ),
    );
  }
}
