import 'package:expense_tracker/pages/login/forgetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  bool _isLoading = false;

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // pop the loading circle
      Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // WRONG EMAIL
      if (e.code == 'user-not-found') {
        // show error to user
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.cyanAccent,
              title: Center(
                child: Text(
                  'Incorrect Email and Password',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            );
          },
        );
      }

      // wrong password
      else if (e.code == 'wrong-password') {
        // show error to user
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.cyanAccent,
              title: Center(
                child: Text(
                  'Incorrect Password',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            );
          },
        );
      }
    }
  }

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _MailIdContainer() {
    return new Container(
      child: new TextField(
        controller: _emailController,
        decoration: new InputDecoration(
            hintText: 'Enter your Mail',
            prefixIcon: Icon(
              Icons.mail_outlined,
              color: Colors.black,
            ),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: new BorderSide(color: Colors.black),
            ),
            isDense: true),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _passwordContainer() {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      child: TextField(
        controller: _passwordController,
        obscureText: passwordVisible,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(
                  () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
            ),
            prefixIcon: Icon(
              Icons.password_outlined,
              color: Colors.black,
            ),
            hintText: 'Password',
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(30),
            ),
            isDense: true),
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () {
        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please fill the required details')));
        }
        signUserIn();
      },
      child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.greenAccent, Colors.blueAccent]),
            borderRadius: BorderRadius.circular(30)),
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.0),
        width: 300.0,
        height: 40.0,
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
        // color: Colors.blue,
      ),
    );
  }

  Widget _body() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.cyan.shade100,
        Colors.cyan.shade100,
      ])),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
            child: Text('Welcome Back',
                style: GoogleFonts.libreBodoni(fontSize: 40)),
          ),
          SizedBox(
            height: 20,
          ),
          _MailIdContainer(),
          SizedBox(
            height: 20,
          ),
          _passwordContainer(),
          SizedBox(
            height: 20,
          ),
          _loginButton(),
          Padding(
              padding: EdgeInsets.only(bottom: 0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Don\'t have an account?',
                      style: TextStyle(color: Colors.black)),
                  Container(
                    child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register'),
                      child: Text('Sign Up.',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 1.0,
                width: MediaQuery.of(context).size.width / 2.7,
                color: Colors.grey,
                child: ListTile(),
              ),
              Text(
                ' OR ',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Container(
                height: 1.0,
                width: MediaQuery.of(context).size.width / 2.7,
                color: Colors.grey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Forgot your login details?',
                  style: TextStyle(color: Colors.black)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForegetPassword()));
                },
                child: Text('Get help logging in.',
                    style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
