import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!.displayName;
  final usere = FirebaseAuth.instance.currentUser!.email;
  final userp = FirebaseAuth.instance.currentUser!.displayName?.substring(0, 1);
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.cyan.shade100,
          Colors.cyan.shade100,
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.cyan,
                  child: Text(
                    userp.toString(),
                    style: TextStyle(fontSize: 50, color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              user.toString(),
              style: TextStyle(fontSize: 30, color: Colors.cyan.shade900),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              usere.toString(),
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                ),
                onPressed: () async {
                  await signUserOut();
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
