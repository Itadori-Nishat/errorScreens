import 'package:flutter/material.dart';

class ScreenSix extends StatelessWidget {
  const ScreenSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: height*0.3,
                  width: width*0.6,
                  child: Image.network("https://images.unsplash.com/photo-1523688471150-efdd09f0f312?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwa"
                      "G90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80",fit: BoxFit.cover,),

                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height*0.15,
                    width: width*0.35,
                    child: Image.network("https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=M3wxMjA3f"
                        "DB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,),
                  ),
                  Container(
                    height: height*0.15,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.network("https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=M3wxMjA3f"
                              "DB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",fit: BoxFit.cover,),
                        ),
                        Positioned(
                          top: 50,
                            left: 80,
                            child: Text("+5",style: TextStyle(
                              fontSize: 25
                            ),))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
