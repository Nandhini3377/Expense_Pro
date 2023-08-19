
import 'package:flutter/material.dart';
enum Categoriess{ Project, Food, Travel, Developer_Cost, Other_Charges }

final  categoryIconss = {
  Categoriess.Project: Image.asset('assets/catproject.png',width: 50,),
  Categoriess.Food:Image.asset('assets/catfood.png',width: 50,),
  Categoriess.Travel: Image.asset('assets/cattravel.png',width: 50,),
  Categoriess.Developer_Cost:Image.asset('assets/catdev.png',width: 50,alignment: Alignment.center,),
  Categoriess.Other_Charges: Image.asset('assets/catothers.png',width: 50,alignment: Alignment.center,),
};


class IncomeList {
  
  final String title;
  final String description;
  final Categoriess category;
  final DateTime date;
  final double iamount;
 

  IncomeList({required this.iamount,required this.title,
      required this.description,
      required this.category,
      required this.date});

//convert map to json to store in sharedpref
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category.index,
      'date': date.toString(),
      'amount': iamount,
      
    };
  }

//convert json to map to fetch data from sharedpref

  factory IncomeList.fromJson(Map<String, dynamic> json) {
    return IncomeList(
     
    iamount: json['expense'] as double,
      title: json['title'] as String,
      description: json['description'] as String,
      category: Categoriess.values[json['category'] as int],
      date: DateTime.parse(json['date'] as String),
    );
  }
}

