import 'package:employee/firebase_options.dart';
import 'package:employee/screens/employee_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(243, 243, 243, 1.0),
      ),

      home: EmployeeList(),
    );
  }
  
}