import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/employee.dart';

class FirebaseService {
  final CollectionReference employeesCollection = FirebaseFirestore.instance.collection('employees');

  Future<List<Employee>> getEmployees() async {
    QuerySnapshot snapshot = await employeesCollection.get();
    List<Employee> employees = snapshot.docs.map((doc) => Employee.fromFirestore(doc)).toList();
    return employees;
  }
}

