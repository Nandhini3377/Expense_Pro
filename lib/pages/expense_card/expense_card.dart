import 'package:expense_tracker/Models/expense_list.dart';
import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:expense_tracker/provider/income_provider.dart';
import 'package:expense_tracker/consts.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {


    final totalExpensesBox = Hive.box<double>('totalExpenses');
    final totalIncomesBox = Hive.box<double>('totalIncomes');
    
    return ValueListenableBuilder(
      valueListenable: totalExpensesBox.listenable(),
      builder: (context,Box<double> expensebox,_){
        final expense = expensebox.isNotEmpty ? expensebox.getAt(0) : 0.0;
          final income = totalIncomesBox.isNotEmpty ? totalIncomesBox.getAt(0) : 0.0;
          final profit=income!-expense!;
      return Container(
        margin: EdgeInsets.all(20),
        height: 170,
        width: w / 0.2,
        decoration: BoxDecoration(
          border: Border.all(),
            borderRadius: BorderRadius.circular(30),
            gradient:
                LinearGradient(colors: [Colors.greenAccent, Colors.blueAccent])),
        child: FutureBuilder(builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error:${snapshot.error}');
          } else {
            return Column(
              children: [
                sh20,
                Text(
                  'Total Profit',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                sh10,
                Text(
                  '₹ $profit',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                sh20,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 20,
                          child: Icon(
                            Icons.arrow_downward,
                            size: 30,
                            color: Colors.green.shade500,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '₹ ${income}',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(
                            Icons.arrow_upward,
                            size: 30,
                            color: Colors.red.shade500,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Expense',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '₹ $expense',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        }),
      );}
    );
  }
}
