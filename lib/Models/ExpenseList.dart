import 'package:expense_tracker/Provider/ExpenseProvider.dart';
import 'package:flutter/material.dart';

enum Categories { Project, Food, Travel, Developer_Cost, Other_Charges }

final  categoryIcons = {
  Categories.Project: Image.asset('assets/catproject.png',width: 50,),
  Categories.Food:Image.asset('assets/catfood.png',width: 50,),
  Categories.Travel: Image.asset('assets/cattravel.png',width: 50,),
  Categories.Developer_Cost:Image.asset('assets/catdev.png',width: 50,alignment: Alignment.center,),
  Categories.Other_Charges: Image.asset('assets/catothers.png',width: 50,alignment: Alignment.center,),
};


class ExpenseList {

  final String title;
  final String description;
  final Categories category;
  final DateTime date;
  final double amount;
 

  ExpenseList({required this.amount,required this.title,
      required this.description,
      required this.category,
      required this.date,} );








//convert map to json to store in sharedpref
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category.index,
      'date': date.toString(),
      'amount': amount,
      
    };
  }
  
//convert json to map to fetch data from sharedpref

  factory ExpenseList.fromJson(Map<String, dynamic> json) {
    return ExpenseList(
     
     
      title: json['title'] as String,
      description: json['description'] as String,
      category: Categories.values[json['category'] as int],
      date: DateTime.parse(json['date'] as String),
       amount: json['amount'] as double,
    );
  }
}
