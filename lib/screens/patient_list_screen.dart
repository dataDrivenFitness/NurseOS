import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nurse_os/state/patient_provider.dart';
import 'package:nurse_os/widgets/patient_card_widget.dart';

class PatientListScreen extends ConsumerWidget {
  const PatientListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final patientAsync = ref.watch(patientListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Patients')),
      body: patientAsync.when(
        data: (patients) => ListView.builder(
          itemCount: patients.length,
          itemBuilder: (_, i) => PatientCardWidget(patient: patients[i]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
