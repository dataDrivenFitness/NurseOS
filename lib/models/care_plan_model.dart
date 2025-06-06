/// Represents a nursing care plan for a patient.
class CarePlanModel {
  final String id;
  final String patientId;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final String createdBy;

  CarePlanModel({
    required this.id,
    required this.patientId,
    required this.title,
    required this.description,
    required this.startDate,
    this.endDate,
    required this.createdAt,
    required this.createdBy,
  });

  factory CarePlanModel.fromMap(Map<String, dynamic> data, String docId) {
    return CarePlanModel(
      id: docId,
      patientId: data['patientId'],
      title: data['title'],
      description: data['description'],
      startDate: DateTime.parse(data['startDate']),
      endDate: data['endDate'] != null ? DateTime.parse(data['endDate']) : null,
      createdAt: DateTime.parse(data['createdAt']),
      createdBy: data['createdBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'patientId': patientId,
      'title': title,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}
