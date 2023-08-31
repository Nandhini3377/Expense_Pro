import 'dart:async';

import 'package:expense_tracker/pages/authpage.dart';
import 'package:expense_tracker/pages/home/home.dart';
import 'package:expense_tracker/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthPage())) ;});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
      height: double.infinity,
       // color: Colors.amber,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            tileMode: TileMode.mirror,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade400,Colors.cyan.shade200,Colors.cyan.shade400,Colors.cyan.shade200])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Expensify',style:GoogleFonts.libreBaskerville(fontSize: 50,color: Colors.black,fontWeight: FontWeight.w200)),
          ],
        ),),
    );
  }
}
