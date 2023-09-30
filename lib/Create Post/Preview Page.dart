import 'dart:io';
import 'package:flutter/material.dart';

class ProductUIDesign1 extends StatelessWidget {
  final String? userName,location,type,title,price,contact,description;
  final File? imageFile;
  ProductUIDesign1({Key? key,
    this.userName,
    this.location,
    this.type,
    this.title,
    this.description,
    this.price,
    this.contact,
    this.imageFile}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(onPressed: () {
          },
              icon: const Icon(Icons.check))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ///Profile picture and details
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         children: [
                //           CircleAvatar(
                //             radius: 22,
                //             backgroundImage: NetworkImage("https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.symmetric(horizontal: 8.0),
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text("${userName.toString()}", style: TextStyle(fontSize: 17,
                //                     fontWeight: FontWeight.bold
                //                 ),),
                //                 Text("${location.toString()}"),
                //                 Row(
                //                   children: [
                //                     Text("12:18 am"),
                //                     Padding(
                //                       padding: EdgeInsets.symmetric(horizontal: 5.0),
                //                       child: Text("•"),
                //                     ),
                //                     Text("July 21, 2023"),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           IconButton(
                //               onPressed: (){
                //                 Fluttertoast.showToast(
                //                     msg: "Shared",
                //                     toastLength: Toast.LENGTH_SHORT,
                //                     backgroundColor: Colors.teal,
                //                     textColor: Colors.white,
                //                     fontSize: 16.0
                //                 );
                //               },
                //               icon: const Icon(Icons.share)),
                //           IconButton(
                //               onPressed: (){
                //                 Fluttertoast.showToast(
                //                     msg: "Bookmarked",
                //                     toastLength: Toast.LENGTH_SHORT,
                //                     backgroundColor: Colors.teal,
                //                     textColor: Colors.white,
                //                     fontSize: 16.0
                //                 );
                //               },
                //               icon: const Icon(Icons.bookmark_add_outlined)),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                ///Room picture
                // CarouselSlider(
                //   options: CarouselOptions(
                //     enableInfiniteScroll: false,
                //     viewportFraction: 1,
                //   ),
                //   items: images.map((imageURL) {
                //     return Builder(
                //       builder: (BuildContext context) {
                //         return Container(
                //           width: MediaQuery.of(context).size.width,
                //           margin: const EdgeInsets.symmetric(horizontal: 5.0),
                //           decoration: const BoxDecoration(
                //             color: Colors.grey,
                //           ),
                //           child: Image.network(
                //             imageURL,
                //             fit: BoxFit.contain,
                //           ),
                //         );
                //       },
                //     );
                //   }).toList(),
                // ),
                if (imageFile != null)
                  Container(
                    height: height*0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Image.file(
                        imageFile!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                ///Title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("${title.toString()}",style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                  ),),
                ),

                ///Contact and price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Tk:", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                            const SizedBox(width: 5,),
                            SizedBox(
                              width: width*0.5,
                              child: Text("${price.toString()}",style: const TextStyle(
                                  fontSize: 18
                              ),
                                overflow: TextOverflow.fade,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Card(
                    //   child: GestureDetector(onTap: () {
                    //     _makePhoneCall(contact);
                    //   }, child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    //     child: const Text("Call", style: TextStyle(
                    //         fontSize: 18
                    //     ),),
                    //   )),
                    // )
                  ],
                ),

                ///Divider after price
                const Divider(),


                ///Type
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Type:", style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(width: 30,),
                      SizedBox(
                        width: width*0.6,
                        child: Text("${type.toString()}",style: const TextStyle(
                            fontSize: 17
                        ),
                          overflow: TextOverflow.fade,
                        ),
                      )
                    ],
                  ),
                ),

                ///Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description:",style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("${description.toString()}",
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
