// import 'package:flutter/material.dart';

// class SaveButton extends StatelessWidget {
//  final void Function() onSave;
//    SaveButton({
//     super.key,required this.onSave
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top:50.0,left:80),
//       child: Container(
//        decoration: BoxDecoration(
//          gradient: LinearGradient(colors: [Colors.greenAccent.shade700, Colors.blueAccent]),
//          border:Border.all(color: Colors.black),
//          borderRadius: BorderRadius.circular(30)
//        ),
//         child: OutlinedButton(
//                     onPressed: () {
//                       onSave();
                  
//                   }, child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 20),),
//                   style: OutlinedButton.styleFrom(
                   
//                     fixedSize: Size(200, 50),
                   
//                     //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                    side: BorderSide.none
                    
//                   ),
//                   ),
//       ),
//     );
//   }
// }
