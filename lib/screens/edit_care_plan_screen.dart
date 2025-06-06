import 'package:flutter/material.dart';
import '../models/care_plan_model.dart';

class EditCarePlanScreen extends StatefulWidget {
  final CarePlanModel carePlan;
  const EditCarePlanScreen({super.key, required this.carePlan});

  @override
  State<EditCarePlanScreen> createState() => _EditCarePlanScreenState();
}

class _EditCarePlanScreenState extends State<EditCarePlanScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  late DateTime _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.carePlan.title);
    _descriptionController = TextEditingController(text: widget.carePlan.description);
    _startDate = widget.carePlan.startDate;
    _endDate = widget.carePlan.endDate;
  }

  void _selectDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : (_endDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  void _save() {
    final updated = CarePlanModel(
      id: widget.carePlan.id,
      patientId: widget.carePlan.patientId,
      title: _titleController.text,
      description: _descriptionController.text,
      startDate: _startDate,
      endDate: _endDate,
    );
    Navigator.pop(context, updated);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Care Plan')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _save,
        label: const Text('Save'),
        icon: const Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildField('Title', _titleController, theme),
            const SizedBox(height: 16),
            _buildField('Description', _descriptionController, theme, maxLines: 4),
            const SizedBox(height: 20),
            _dateTile('Start Date', _startDate, () => _selectDate(isStart: true), theme),
            const SizedBox(height: 10),
            _dateTile('End Date', _endDate, () => _selectDate(isStart: false), theme),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, ThemeData theme, {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: theme.colorScheme.surfaceVariant,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _dateTile(String label, DateTime? date, VoidCallback onTap, ThemeData theme) {
    final text = date == null ? 'None' : date.toLocal().toIso8601String().split('T').first;
    return ListTile(
      title: Text(label, style: theme.textTheme.labelSmall),
      subtitle: Text(text, style: theme.textTheme.bodyMedium),
      trailing: const Icon(Icons.calendar_today),
      onTap: onTap,
    );
  }
}
