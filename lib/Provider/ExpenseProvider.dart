import 'dart:collection';
import 'dart:convert';

import 'package:expense_tracker/Models/ExpenseList.dart';
import 'package:expense_tracker/Provider/IncomeProvider.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';


class ExpenseProvider extends ChangeNotifier {
 

   final List<ExpenseList> _expense = [];
  List<ExpenseList> get expenses => _expense;


void addExpense(ExpenseList expense) async{
    _expense.add(expense);
    //await saveToSharedPref();
    notifyListeners();
  }
 void removeExpense(int index){
    _expense.removeAt(index);
    notifyListeners();
  }

  double calculateExpense() {
    double totalExpense = 0;
    for (var exp in expenses) {
      double amount = exp.amount;
      if (amount < 0) {
        totalExpense += amount.abs();
       
      }
      else{
        totalExpense += amount.abs();
      }
    }
    return totalExpense;
  }

  double calculateProfit() {
    double totalIncome = IncomeProvider().calculateIncome();
    double totalExpense = calculateExpense();
    return totalIncome - totalExpense;
  }

}