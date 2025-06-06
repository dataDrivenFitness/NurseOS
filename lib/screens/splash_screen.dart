import 'package:flutter/material.dart';
import 'patient_list_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PatientListScreen(); // Direct render, no routing
  }
}
