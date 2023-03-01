import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,

       body:  Center(
         child: Text(
           "Home Screen",
           textAlign: TextAlign.center,
           style: TextStyle(
             color: Colors.black,
             fontSize: 22,
           ),
         ),
       ),
    );
  }
}
