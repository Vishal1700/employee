import 'package:employee/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../utils/employee.dart';
import '../constants/employee_container.dart';

class EmployeeList extends StatelessWidget {
  EmployeeList({Key? key});

  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Employee>>(
      future: firebaseService.getEmployees(),
      builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );// Show loading indicator while fetching data

    } else if (snapshot.hasError) {
    return Scaffold(
      body: Text('Error: ${snapshot.error}'),
    );

    } else {
      List<Employee> employees = snapshot.data ?? [];
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Employee List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index){
                  final employee = employees[index];
                  return EmployeeCard(employee: employee);
                },
              ),
            ),
          ],
        ),
      );
      }
      }
    );
  }
}

