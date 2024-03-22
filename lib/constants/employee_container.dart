import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import '../utils/employee.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,

                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(45),
                  ),

                  child: Image.network(
                    employee.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                Expanded(
                  child: ListTile(
                    title: Text(
                      employee.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Since: ${employee.yearsWithOrganization} years', style: const TextStyle(fontSize: 16, color: Color.fromRGBO(123, 123, 123, 1.0)),),
                        Text(employee.isActive ? 'Active' : 'Deactivate', style: employee.isActive ? const TextStyle(fontSize: 15, color: Colors.green ): const TextStyle(fontSize: 15, color: Colors.red)),

                      ],
                    ),
                    trailing: employee.yearsWithOrganization > 5 && employee.isActive
                        ? const Icon(Icons.flag_circle_outlined, color: Colors.green, size: 35,)
                        : null,
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}