import 'package:expense_tracker/pages/login/login.dart';
import 'package:expense_tracker/pages/register/register.dart';
import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:expense_tracker/provider/income_provider.dart';
import 'package:expense_tracker/pages/add_expense/add_expense.dart';
import 'package:expense_tracker/pages/add_income/add_income.dart';
import 'package:expense_tracker/pages/home/home.dart';
import 'package:expense_tracker/pages/splash/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ExpenseProvider.initHive();
  await IncomeProvider.initHive();
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
        initialRoute: '/splash',
        routes: {
          '/home': (_) => Home(),
          '/splash': (_) => Splash(),
          '/income': (_) => AddIncome(),
          '/expense': (_) => AddExpense(),
          '/register': (_) => SignupScreen(),
          '/login': (_) => LoginScreen(),
        },
      ),
    );
  }
}
