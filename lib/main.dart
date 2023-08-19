import 'package:expense_tracker/Provider/ExpenseProvider.dart';
import 'package:expense_tracker/Provider/IncomeProvider.dart';
import 'package:expense_tracker/Screens/AddExpense/AddExpense.dart';
import 'package:expense_tracker/Screens/AddIncome/AddIncome.dart';
import 'package:expense_tracker/Screens/Home/home.dart';
import 'package:expense_tracker/Screens/Splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IncomeProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: MaterialApp(
        // home:Splash(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (_) => Home(),
          '/splash': (_) => Splash(),
          '/income': (_) => AddIncome(),
          '/expense': (_) => AddExpense(),
        },
      ),
    );
  }
}
