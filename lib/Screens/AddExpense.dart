import 'package:flutter/material.dart';
class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _IncomeState();
}

class _IncomeState extends State<AddExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('expense')),
    );
  }
}