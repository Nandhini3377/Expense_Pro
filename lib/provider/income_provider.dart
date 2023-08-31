import 'dart:convert';
import 'package:expense_tracker/models/income_list.dart';
import 'package:expense_tracker/models/incomelist_adaptor.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class IncomeProvider extends ChangeNotifier {


static Future<void> initHive() async {
    await Hive.initFlutter();
   await Hive.openBox<double>('totalIncomes');
    Hive.registerAdapter(IncomeListAdapter());
    await Hive.openBox<IncomeList>('MyIncome');
  }

  static Box<IncomeList> getMyIncome() {
    return Hive.box('MyIncome');
  }

  static Future<void> addIncome(IncomeList income) async {
    final exp = getMyIncome();
    await exp.add(income);
    
  }
static Future<void> removeIncome(int index) async {
    final exp = getMyIncome();
    await exp.deleteAt(index);
  }
double calculateTotalIncome() {
 final exp = getMyIncome().values.toList();
  return exp.fold(0.0, (total, expense) => total + expense.iamount);
}
Future<void> storeTotalIncomes() async {
  double totalIncome=calculateTotalIncome();
  final totalIncomeBox =Hive.box<double>('totalIncomes');
  await totalIncomeBox.clear(); // Clear previous value if needed
  await totalIncomeBox.add(totalIncome);
}


//    final List<IncomeList> _income = [];
//   List<IncomeList> get income => _income;

// static Future<void> removeIncome(int index) async {
//     final exp = getMyIncome();
//     await exp.deleteAt(index);
//   }

  
//   double calculateIncome() {
//     double totalIncome = 0;
//     for (var expense in _income) { 
      
//         double amount = expense.iamount;
//         if (amount > 0) {
//           totalIncome += amount;
//         }
      
//     }
//     return totalIncome;
//   }
}


