import 'package:expense_tracker/models/income_list.dart';
import 'package:expense_tracker/provider/income_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

final _formatter = DateFormat.yMd();

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _IncomeState();
}

class _IncomeState extends State<AddIncome> {
  TextEditingController _ititle = TextEditingController();
  TextEditingController _idescription = TextEditingController();
  TextEditingController _iamount = TextEditingController();

  Future<void> onSave() async {
    if (_ititle.text.isEmpty ||
        
        _iamount.text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    } else {
      // final pro = Provider.of<IncomeProvider>(context, listen: false);
      IncomeProvider.addIncome(IncomeList(
          title: _ititle.text,
          description: _idescription.text,
          category: _selected,
          date: selectedDate!,
          iamount: double.parse(_iamount.text)));
      //await pro.saveToSharedPref();
      IncomeProvider().calculateTotalIncome();
      await IncomeProvider().storeTotalIncomes();
      _iamount.clear();
      _idescription.clear();
      _ititle.clear();
    }
    Navigator.pushNamed(context, '/home');
  }

  DateTime? selectedDate;
  Categoriess _selected = Categoriess.Project;
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
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade300,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                  child: Text(
                'ADD INCOME',
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
                    controller: _ititle,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.assignment_outlined,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(60)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            borderSide:
                                BorderSide(width: 3.0, color: Colors.cyan)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Enter Note',
                        hintStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
                  child: TextField(
                    controller: _iamount,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      // prefixText: '₹',
                      prefixIcon: Icon(
                        Icons.money_outlined,
                        color: Colors.black,
                      ),
                      hintText: 'Enter Amount',
                      hintStyle: TextStyle(fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          borderSide:
                              BorderSide(width: 3.0, color: Colors.cyan)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          borderSide: BorderSide(color: Colors.black)),
                      prefixStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60)),
                    ),
                  ),
                ),
                ThirdRow(),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 80),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.greenAccent.shade700,
                          Colors.blueAccent
                        ]),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30)),
                    child: OutlinedButton(
                      onPressed: () {
                        onSave();
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size(200, 50),

                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          side: BorderSide.none),
                    ),
                  ),
                )
              ],
            ))
          ],
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
                padding:
                    EdgeInsets.only(left: 16, right: 19, top: 13, bottom: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                side: BorderSide(),
              ),
              onPressed: () {
                _datePicker();
              },
              icon: Icon(Icons.calendar_month, color: Colors.black),
              label: Text(
                selectedDate == null
                    ? 'Select Date'
                    : _formatter.format(
                        selectedDate!,
                      ),
                style: TextStyle(color: Colors.black),
              )),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), border: Border.all()),
          child: DropdownButton(
              underline: Container(color: Colors.transparent),
              icon: Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Icon(Icons.arrow_drop_down_circle_outlined),
              ),
              iconSize: 24,
              padding: EdgeInsets.only(left: 10),
              focusColor: Colors.amber,
              iconEnabledColor: Colors.black,
              borderRadius: BorderRadius.circular(10),
              value: _selected,
              items: Categoriess.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selected = value;
                });
              }),
        )
      ],
    );
  }
}
