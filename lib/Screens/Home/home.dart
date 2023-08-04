import 'package:expense_tracker/Screens/AddIncome.dart';
import 'package:expense_tracker/Screens/Expensecard/Expensecard.dart';
import 'package:expense_tracker/consts.dart';
import 'package:flutter/material.dart';

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
                ? Icon(
                    Icons.money,
                    color: Colors.deepPurple.shade800,
                  )
                : Icon(
                    Icons.mobile_screen_share_outlined,
                    color: Colors.deepPurple.shade800,
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
      // Handle the selected option here
      //print('Selected Option: $selectedOption');
      if (selectedOption == 'Add Income') {
       
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddIncome()));
      } else {
        Navigator.pushReplacementNamed(context, '/expense');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      //backgroundColor:secondary,
      appBar: AppBar(
        
      
        backgroundColor: Colors.white,
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
            backgroundColor: Colors.grey.shade300,
            child: Icon(
              Icons.person_2_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              highlightColor: Colors.greenAccent,
              onPressed: () {
                showOptionsPopup(context);
              },
              icon: Icon(
                Icons.add,
                color: Colors.cyanAccent.shade700,
                size: 35,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ExpenseCard(w: w),
            // sh10,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'All Transcations',
                            style: TextStyle(
                                color: Colors.blueAccent.shade700, fontSize: 15),
                          ))),
                  Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'All Income',
                            style: TextStyle(
                                color: Colors.blueAccent.shade700, fontSize: 15),
                          ))),
                  Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
          //             decoration: BoxDecoration( borderRadius: BorderRadius.circular(50),
          // gradient: LinearGradient(
          //     colors: [Colors.greenAccent, Colors.blueAccent])),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide.none,),
                          onPressed: () {},
                          child: Text(
                            'All Expenses',
                            style: TextStyle(
                                color: Colors.blueAccent.shade700, fontSize: 15),
                          )))
                ],
              ),
            )
            //  Expanded(
            //    child: Container(
            //     height: 60,
            //     width: double.infinity,
            //     color: Colors.amber,
            //     child: Text('hgg',style: TextStyle(color: Colors.black),),
      
            //    ),
            //  )
          ],
        ),
      ),
    );
  }
}
