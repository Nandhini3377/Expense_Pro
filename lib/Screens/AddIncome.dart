import 'package:flutter/material.dart';
class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _IncomeState();
}

class _IncomeState extends State<AddIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('income')),
    );
  }
}