enum Categories{Project,Food,Travel,Developer_Cost,Other_Charges}


class Expense{
  final String title;
  final String description;
  final Categories category;
  final DateTime date;
  final int income;
  final int expense;
  final int profit;
 
 Expense(this.profit,this.income,this.expense,{required this.title,required this.description,required this.category,required this.date});

}