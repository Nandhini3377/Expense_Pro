import 'package:expense_tracker/Screens/AddExpense.dart';
import 'package:expense_tracker/Screens/AddIncome.dart';
import 'package:expense_tracker/Screens/Home/home.dart';
import 'package:expense_tracker/models/expense.dart';

import 'package:expense_tracker/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // home:Splash(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/home':(_) => Home(),
        '/splash':(_) => Splash(),
        '/income':(_)=>AddIncome(),
         '/expense':(_)=>AddExpense(),
      },
    );
  }
}