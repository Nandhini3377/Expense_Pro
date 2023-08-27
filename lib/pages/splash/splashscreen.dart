import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color:Colors.white,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.start,
             
            children: [
              SizedBox(height:90,),
              Center(child: Text('Expense Tracker',style: TextStyle(fontSize:30,fontWeight: FontWeight.bold,color: Colors.purple.shade800),)),
              SizedBox(height:30,),
              Image.asset("assets/page1.png",width: 250,),
              SizedBox(height:30,),
              Center(child: Text('Track, analyze, and conquer \n \t your expenses like a pro.',style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color: Colors.purple.shade700),)),
              SizedBox(height:30,),
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 19),
                child: Text('Track your expenses effortlessly and take control of your finances with our powerful expense tracker app. Stay on top of your spending and make informed financial decisions.',style: TextStyle(fontSize:17,color:Colors.black, fontWeight:FontWeight.w300),),
                
              ),
              SizedBox(height:38,),
              OutlinedButton(
                onPressed: (){
              Navigator.pushNamed(context,'/home');
              }, child: Text('Get Started',style: TextStyle(color: Colors.white,fontSize: 20),),
              style: OutlinedButton.styleFrom(
               
                fixedSize: Size(260, 50),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                side: BorderSide(color: Colors.black)
                
              ),
              )
            ],
          ),
        ),
      ),
    );
  } 
}