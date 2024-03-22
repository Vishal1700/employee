import 'package:cloud_firestore/cloud_firestore.dart';

class Employee {
  final String name;
  final int yearsWithOrganization;
  final bool isActive;
  final String imageUrl;

  Employee({
    required this.name,
    required this.yearsWithOrganization,
    required this.isActive,
    required this.imageUrl,
  });

  factory Employee.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Employee(
      name: data['name'],
      yearsWithOrganization: data['yearsWithOrganization'],
      isActive: data['isActive'],
      imageUrl: data['imageUrl']
    );
  }
}