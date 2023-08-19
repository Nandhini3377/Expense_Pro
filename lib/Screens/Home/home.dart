import 'dart:convert';

import 'package:expense_tracker/Models/IncomeList.dart';
import 'package:expense_tracker/Provider/ExpenseProvider.dart';
import 'package:expense_tracker/Provider/IncomeProvider.dart';
import 'package:expense_tracker/Screens/AddIncome/AddIncome.dart';
import 'package:expense_tracker/Screens/Expensecard/Expensecard.dart';
import 'package:expense_tracker/consts.dart';
import 'package:expense_tracker/Models/ExpenseList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> options = ['Add Income', 'Add Expense'];
  void showOptionsPopup(BuildContext context) async {
    String? selectedOption = await showMenu<String>(
      color: Colors.grey.shade50,
      context: context,
      position: RelativeRect.fromLTRB(10, 110, 0, 0),
      items: options.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Row(children: [
            option == 'Add Income'
                ? Image.asset(
                    'assets/income.png',
                    width: 22,
                  )
                : Image.asset(
                    'assets/expense.png',
                    width: 22,
                  ),
            SizedBox(
              width: 10,
            ),
            Text(
              option,
              style: TextStyle(fontSize: 18, color: Colors.black),
            )
          ]),
        );
      }).toList(),
    );

    if (selectedOption != null) {
      if (selectedOption == 'Add Income') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AddIncome()));
      } else {
        Navigator.pushReplacementNamed(context, '/expense');
      }
    }
  }

  String selected = 'All Transactions';

  void changeButton(String buttonName) {
    setState(() {
      selected = buttonName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final incomeProvider = Provider.of<IncomeProvider>(context);

    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      //backgroundColor:secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome !',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Priya',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.cyan,
            // child:
            child: Text(
              'P',
              style: TextStyle(fontSize: 27, color: Colors.black),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              highlightColor: Colors.greenAccent,
              onPressed: () {
                showOptionsPopup(context);
              },
              icon: Icon(
                Icons.add,
                color: Colors.cyanAccent.shade700,
                size: 39,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ExpenseCard(w: w),
          // sh10,
          ScrollableRow(
            selectedOption: selected,
            changeState: changeButton,
          ),
          sh10,

          if (selected == 'All Expenses')
            ExpenseView(expenseProvider: expenseProvider),

          if (selected == 'All Income')
            IncomeView(incomeProvider: incomeProvider),

          if (selected == 'All Transactions')
            BothView(
                expenseProvider: expenseProvider,
                incomeProvider: incomeProvider),
        ],
      ),
    );
  }
}

class BothView extends StatelessWidget {
  const BothView({
    super.key,
    required this.expenseProvider,
    required this.incomeProvider,
  });

  final ExpenseProvider expenseProvider;
  final IncomeProvider incomeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        //height: 90,
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount:
              expenseProvider.expenses.length + incomeProvider.income.length,
          itemBuilder: (context, index) {
            if (index < expenseProvider.expenses.length) {
              // Expense list item
              ExpenseList expenseItem = expenseProvider.expenses[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (_) {
                  expenseProvider.removeExpense(index);
                },
                background: Container(
                  //color: Colors.red.shade400,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Container(
                  // ... Expense list item widget ...

                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.green])),
                  child: Card(
                    elevation: 1.0,
                    //color: Colors.white,
                    // ExpenseList expenseItem = snapshot.data[index],
                    child: ListTile(
                      title: Text(
                        expenseItem.title.toUpperCase(),
                        style: GoogleFonts.abhayaLibre(fontSize: 22),
                      ),
                      subtitle: Text(
                        expenseItem.category.name,
                      ),
                      leading: categoryIcons[expenseItem.category],
                      trailing: Column(children: [
                        sh10,
                        Text(
                          '- ₹ ${expenseItem.amount}',
                          style: TextStyle(
                              fontSize: 18, color: Colors.red.shade900),
                        ),
                        sh10,
                        Text(
                          expenseItem.date.day.toString() +
                              "/" +
                              expenseItem.date.month.toString() +
                              "/" +
                              expenseItem.date.year.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            } else {
              // Income list item
              IncomeList incomeItem = incomeProvider
                  .income[index - expenseProvider.expenses.length];
              return Dismissible(
                key: UniqueKey(), // Use a unique identifier for each item
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // Call the deleteExpense method to remove the item from the list
                  incomeProvider.removeExpense(index);
                },
                background: Container(
                  //color: Colors.red.shade400,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      //  border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.green])),
                  child: Card(
                    elevation: 1.0,
                    //color: Colors.white,
                    // ExpenseList expenseItem = snapshot.data[index],
                    child: ListTile(
                      title: Text(
                        incomeItem.title.toUpperCase(),
                        style: GoogleFonts.abhayaLibre(fontSize: 22),
                      ),
                      subtitle: Text(
                        incomeItem.category.name,
                      ),
                      leading: categoryIconss[incomeItem.category],
                      trailing: Column(children: [
                        sh10,
                        Text(
                          '+ ₹ ${incomeItem.iamount}',
                          style: TextStyle(
                              fontSize: 18, color: Colors.green.shade900),
                        ),
                        sh10,
                        Text(
                          incomeItem.date.day.toString() +
                              "/" +
                              incomeItem.date.month.toString() +
                              "/" +
                              incomeItem.date.year.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class IncomeView extends StatelessWidget {
  const IncomeView({
    super.key,
    required this.incomeProvider,
  });

  final IncomeProvider incomeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: incomeProvider.income.length,
          itemBuilder: ((context, index) {
            IncomeList incomeItem = incomeProvider.income[index];
            return Dismissible(
              key: UniqueKey(), // Use a unique identifier for each item
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // Call the deleteExpense method to remove the item from the list
                incomeProvider.removeExpense(index);
              },
              background: Container(
                //color: Colors.red.shade400,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    //border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.green])),
                child: Card(
                  elevation: 1.0,
                  //color: Colors.white,
                  // ExpenseList expenseItem = snapshot.data[index],
                  child: ListTile(
                    title: Text(
                      incomeItem.title.toUpperCase(),
                      style: GoogleFonts.abhayaLibre(fontSize: 22),
                    ),
                    subtitle: Text(
                      incomeItem.category.name,
                    ),
                    leading: categoryIconss[incomeItem.category],
                    trailing: Column(children: [
                      sh10,
                      Text(
                        '+ ₹ ${incomeItem.iamount}',
                        style: TextStyle(
                            fontSize: 18, color: Colors.green.shade900),
                      ),
                      sh10,
                      Text(
                        incomeItem.date.day.toString() +
                            "/" +
                            incomeItem.date.month.toString() +
                            "/" +
                            incomeItem.date.year.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ExpenseView extends StatelessWidget {
  const ExpenseView({
    super.key,
    required this.expenseProvider,
  });

  final ExpenseProvider expenseProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: expenseProvider.expenses.length,
          itemBuilder: ((context, index) {
            ExpenseList expenseItem = expenseProvider.expenses[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                expenseProvider.removeExpense(index);
              },
              background: Container(
                //color: Colors.red.shade400,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    //border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.green])),
                child: Card(
                  elevation: 1.0,
                  //color: Colors.white,
                  // ExpenseList expenseItem = snapshot.data[index],
                  child: ListTile(
                    title: Text(
                      expenseItem.title.toUpperCase(),
                      style: GoogleFonts.abhayaLibre(fontSize: 22),
                    ),
                    subtitle: Text(
                      expenseItem.category.name,
                    ),
                    leading: categoryIcons[expenseItem.category],
                    trailing: Column(children: [
                      sh10,
                      Text(
                        '- ₹ ${expenseItem.amount}',
                        style:
                            TextStyle(fontSize: 18, color: Colors.red.shade900),
                      ),
                      sh10,
                      Text(
                        expenseItem.date.day.toString() +
                            "/" +
                            expenseItem.date.month.toString() +
                            "/" +
                            expenseItem.date.year.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Widget _buildListView() {
//     return Consumer2<ExpenseProvider, IncomeProvider>(
//       builder: (context, expenseProvider, incomeProvider, child) {
//         final expenses = expenseProvider.loadFromHive();
//         final incomes = incomeProvider.loadFromHive();

//         return ListView.builder(
//           itemCount: expenses.+ incomes.length,
//           itemBuilder: (context, index) {
//             if (index < incomes.length) {
//               final income = incomes[index];
//               return ListTile(
//                 title: Text(income.title),
//                 subtitle: Text(income.description),
//                 trailing: Text("+ \$${income.iamount.toStringAsFixed(2)}"),

//               );
//             } else {
//               final expense = expenses[index - incomes.length];
//               return ListTile(
//                 title: Text(expense.title),
//                 subtitle: Text(expense.description),
//                 trailing: Text("- \$${expense.amount.toStringAsFixed(2)}"),

//               );
//             }
//           },
//         );
//       },
//     );
//   }
// }

class ScrollableRow extends StatelessWidget {
  final String selectedOption;
  final Function(String) changeState;
  ScrollableRow(
      {super.key, required this.selectedOption, required this.changeState});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildButton('All Transactions', 16.0, context),
          _buildButton('All Expenses', 9.0, context),
          _buildButton('All Income', 9.0, context),
        ],
      ),
    );
  }

  Widget _buildButton(String btntext, double value, BuildContext context) {
    final isActive = btntext == selectedOption;
    return Container(
        height: 40,
        margin: EdgeInsets.only(
          left: value,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(),
          gradient: isActive
              ? LinearGradient(
                  colors: [
                    Colors.greenAccent.shade200,
                    Colors.blueAccent.shade200
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
        ),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide.none, shape: CircleBorder()

                // backgroundColor: Colors.cyan,
                ),
            onPressed: () {
              changeState(btntext);
            }, //onpress

            child: isActive
                ? Text(
                    btntext,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                : Text(
                    btntext,
                    style:
                        TextStyle(fontSize: 15, color: Colors.purple.shade700),
                  )));
  }
}
