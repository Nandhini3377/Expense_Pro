import 'package:expense_tracker/consts.dart';
import 'package:flutter/material.dart';
class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 170,
      width: w / 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              colors: [Colors.greenAccent, Colors.blueAccent])),
      child: Column(
        children: [
          sh20,
          Text(
            'Total Turnover',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          sh10,
          Text(
            '₹ 10,000',
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
                      '₹ 10,000',
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
                      '₹ 10,000',
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
      ),
    );
  }
}
