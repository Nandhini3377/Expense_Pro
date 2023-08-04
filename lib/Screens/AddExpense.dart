import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';
final _formatter=DateFormat.yMd();
class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _IncomeState();
}

class _IncomeState extends State<AddExpense> {
  DateTime? selectedDate;
  Categories _selected=Categories.Project;
  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey.shade700,
              ))
        ],
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          height: 665,
          
          color: Colors.cyan,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                    child: Text(
                  'ADD EXPENSE',
                  style: TextStyle(fontSize: 30),
                )),
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.assignment_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60)),
                          hintText: 'Enter Title',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.assignment_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60)),
                          hintText: 'Enter Description',
                          hintStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixText: '₹',
                          labelText: 'Enter Amount',
                          prefixStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60)),
                         
                          ),
                    ),
                  ),
                  ThirdRow(),
                   Padding(
                     padding: const EdgeInsets.only(top:50.0,left:80),
                     child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.greenAccent.shade700, Colors.blueAccent]),
                        border:Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30)
                      ),
                       child: OutlinedButton(
                                   onPressed: (){
                                 
                                 }, child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20),),
                                 style: OutlinedButton.styleFrom(
                                  
                                   fixedSize: Size(200, 50),
                                  
                                   //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                  side: BorderSide.none
                                   
                                 ),
                                 ),
                     ),
                   )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Row ThirdRow() {
    return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 16, right: 19, top: 13, bottom: 13),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          side: BorderSide(),
                        ),
                        onPressed: () {
                          _datePicker();
                        },
                        icon: Icon(Icons.calendar_month),
                        label: Text(selectedDate==null?
                          'Select Date':_formatter.format(selectedDate!,),
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  SizedBox(width: 22,),
                  Container(
                    margin: EdgeInsets.only(top:20),
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all()
                    ),
                    child: DropdownButton(
                     iconSize: 25,
                      padding: EdgeInsets.only(left: 10),
                     focusColor: Colors.amber,
                     iconEnabledColor: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                                     value: _selected,
                      items: Categories.values.map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      )
                      ).toList(),
                       onChanged: (value){
                        if(value==null){
                          return;
                        }
                        setState(() {
                          _selected=value;
                        });
                      }),
                  )
                ],
              );
  }
}
