/// Represents a care plan for a patient
class CarePlanModel {
  final String id;
  final String patientId;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime? endDate;

  CarePlanModel({
    required this.id,
    required this.patientId,
    required this.title,
    required this.description,
    required this.startDate,
    this.endDate,
  });

  factory CarePlanModel.fromJson(Map<String, dynamic> json) {
    return CarePlanModel(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
    };
  }
}
