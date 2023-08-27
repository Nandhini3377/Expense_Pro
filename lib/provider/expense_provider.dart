import 'dart:collection';
import 'dart:convert';

import 'package:expense_tracker/models/expense_list.dart';
import 'package:expense_tracker/models/expenselist_adaptor.dart';
import 'package:expense_tracker/provider/income_provider.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class ExpenseProvider extends ChangeNotifier {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox<double>('totalExpenses');
    Hive.registerAdapter(ExpenseListAdapter());
    await Hive.openBox<ExpenseList>('MyExpense');
  }

  static Box<ExpenseList> getMyExpense() {
    return Hive.box('MyExpense');
  }

  static Future<void> addExpense(ExpenseList expense) async {
    final exp = getMyExpense();
    await exp.add(expense);
    
   
  }

static Future<void> removeExpense(int index) async {
    final exp = getMyExpense();
    await exp.deleteAt(index);
    
  }

double calculateTotalExpenses() {
 final exp = getMyExpense().values.toList();
  return exp.fold(0.0, (total, expense) => total + expense.amount);
}
Future<void> storeTotalExpenses() async {
  double totalExpenses=calculateTotalExpenses();
  final totalExpensesBox = Hive.box<double>('totalExpenses');
  await totalExpensesBox.clear(); // Clear previous value if needed
  await totalExpensesBox.add(totalExpenses);
}
  
  // final List<ExpenseList> _expense = [];
  // List<ExpenseList> get expenses => _expense;

// void addExpense(ExpenseList expense) async{
//     _expense.add(expense);
//     //await saveToSharedPref();
//     notifyListeners();
//   }
  // void removeExpense(int index) {
  //   _expense.removeAt(index);
  //   notifyListeners();
  // }

//   double calculateExpense() {
//     double totalExpense = 0;
//     for (var exp in expenses) {
//       double amount = exp.amount;
//       if (amount < 0) {
//         totalExpense += amount.abs();
//       } else {
//         totalExpense += amount.abs();
//       }
//     }
//     return totalExpense;
//   }

//   double calculateProfit() {
//     double totalIncome = IncomeProvider().calculateIncome();
//     double totalExpense = calculateExpense();
//     return totalIncome - totalExpense;
//   }
// }
}