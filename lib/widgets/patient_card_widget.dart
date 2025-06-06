import 'package:flutter/material.dart';
import 'package:nurse_os/models/patient_model.dart';
import 'package:nurse_os/screens/care_plan_screen.dart';

/// Displays an individual patient's summary in a card and navigates on tap.
class PatientCardWidget extends StatelessWidget {
  final PatientModel patient;

  const PatientCardWidget({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(patient.name),
        subtitle: Text('${patient.diagnosis} • Room ${patient.roomNumber}'),
        trailing: Text('${patient.age} yrs'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CarePlanScreen(patientId: patient.id),
            ),
          );
        },
      ),
    );
  }
}
