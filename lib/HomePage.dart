import 'package:error_screen/Error_Screen/Screen%201.dart';
import 'package:error_screen/Error_Screen/Screen%202.dart';
import 'package:error_screen/Error_Screen/Screen%203.dart';
import 'package:error_screen/Error_Screen/Screen%204.dart';
import 'package:error_screen/Error_Screen/Screen%205.dart';
import 'package:error_screen/Error_Screen/Screen%206.dart';
import 'package:error_screen/Error_Screen/Screen%207.dart';
import 'package:error_screen/ImagePicer%20and%20Show.dart';
import 'package:error_screen/M-namaj%20time.dart';
import 'package:flutter/material.dart';

class ErrorHomePage extends StatelessWidget {
  const ErrorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Error Pages"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenOne()));
            },
                child: Text("Screen One")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenTwo()));
            },
                child: Text("Screen Two")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UsersScreen()));
            },
                child: Text("Screen Three")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenFour()));
            },
                child: Text("Screen Four")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenFive()));
            },
                child: Text("Screen Five")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSix()));
            },
                child: Text("Screen Six")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenSeven()));
            },
                child: Text("Screen Seven")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AzanAppUIDesign()));
            },
                child: Text("Masud ui")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShowFullImageOnTap()));
            },
                child: Text("Show Full Image")),
          ],
        ),
      ),
    );
  }
}
