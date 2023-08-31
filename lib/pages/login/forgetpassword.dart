import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForegetPassword extends StatefulWidget {
  const ForegetPassword({super.key});

  @override
  State<ForegetPassword> createState() => _ForegetPasswordState();
}

class _ForegetPasswordState extends State<ForegetPassword> {
  TextEditingController _remail = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _remail.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! Check your email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  void dispose() {
    _remail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
      padding: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.cyan.shade100,Colors.cyan.shade100,])
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your email and we will send you the reset link',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(
              height: 30,
            ),
            Container(
              child: new TextField(
                controller: _remail,
                decoration: new InputDecoration(
                    hintText: 'Enter your Mail',
                    prefixIcon: Icon(
                      Icons.mail_outlined,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: new BorderSide(color: Colors.black),
                    ),
                    isDense: true),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.greenAccent, Colors.blueAccent]),
                  borderRadius: BorderRadius.circular(30)),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0),
              width: 300.0,
              height: 40.0,
              child: TextButton(
                onPressed: () {
                  passwordReset();
                  Navigator.pushNamed(context,'/login');
                },
              child: Text( "Reset Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),)
              ),
              // color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
