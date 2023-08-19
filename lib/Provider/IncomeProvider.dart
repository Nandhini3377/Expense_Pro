import 'dart:convert';
import 'package:expense_tracker/Models/IncomeList.dart';
import 'package:flutter/material.dart';


class IncomeProvider extends ChangeNotifier {
   final List<IncomeList> _income = [];
  List<IncomeList> get income => _income;


void addIncome(IncomeList expense) async{
    _income.add(expense);
    //await saveToSharedPref();
    notifyListeners();
  }
 void removeExpense(int index){
    _income.removeAt(index);
    notifyListeners();
  }


  
  double calculateIncome() {
    double totalIncome = 0;
    for (var expense in _income) { 
      
        double amount = expense.iamount;
        if (amount > 0) {
          totalIncome += amount;
        }
      
    }
    return totalIncome;
  }
}


