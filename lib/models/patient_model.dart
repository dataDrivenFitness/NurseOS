/// Represents a patient in the NurseOS system.
class PatientModel {
  final String id;
  final String name;
  final int age;
  final String roomNumber;
  final String diagnosis;
  final DateTime admittedAt;
  final String createdBy;

  PatientModel({
    required this.id,
    required this.name,
    required this.age,
    required this.roomNumber,
    required this.diagnosis,
    required this.admittedAt,
    required this.createdBy,
  });

  /// Converts Firestore document to PatientModel.
  factory PatientModel.fromMap(Map<String, dynamic> data, String docId) {
    return PatientModel(
      id: docId,
      name: data['name'],
      age: data['age'],
      roomNumber: data['roomNumber'],
      diagnosis: data['diagnosis'],
      admittedAt: DateTime.parse(data['admittedAt']),
      createdBy: data['createdBy'],
    );
  }

  /// Converts model to a Firestore-compatible map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'roomNumber': roomNumber,
      'diagnosis': diagnosis,
      'admittedAt': admittedAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}
