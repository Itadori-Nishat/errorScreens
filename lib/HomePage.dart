import 'package:error_screen/Create%20Post/Create%20form.dart';
import 'package:error_screen/Error_Screen/Screen%201.dart';
import 'package:error_screen/Error_Screen/Screen%202.dart';
import 'package:error_screen/Error_Screen/Screen%203.dart';
import 'package:error_screen/Error_Screen/Screen%204.dart';
import 'package:error_screen/Error_Screen/Screen%205.dart';
import 'package:error_screen/Error_Screen/Screen%206.dart';
import 'package:error_screen/Error_Screen/Screen%207.dart';
import 'package:error_screen/ImageBackground.dart';
import 'package:error_screen/M-namaj%20time.dart';
import 'package:error_screen/MultipleImagePicker.dart';
import 'package:flutter/material.dart';

import 'ImagePicker and Show.dart';

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
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => UsersScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );

            },
                child: Text("Screen Three")),
            TextButton(onPressed: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => Example(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                ),
              );



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
              Navigator.push(context, MaterialPageRoute(builder: (context) => AzanAppUIDesign()));
            },
                child: Text("Masud ui")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShowFullImageOnTap()));
            },
                child: Text("Single image Full view")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MultipleImagePicker()));
            },
                child: Text("Multiple Image picker")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageBackground()));
            },
                child: Text("Image Background")),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePostForm()));
            },
                child: Text("Create Form")),
          ],
        ),
      ),
    );
  }
}
