import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ShowFullImageOnTap extends StatefulWidget {
  const ShowFullImageOnTap({Key? key}) : super(key: key);

  @override
  State<ShowFullImageOnTap> createState() => _ShowFullImageOnTapState();
}

class _ShowFullImageOnTapState extends State<ShowFullImageOnTap> {
  File? selectedPhoto;
  void _uploadPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['jpg', 'jpeg', 'png']);
    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        selectedPhoto = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (selectedPhoto != null)

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewImage(image: selectedPhoto)));
              },
              child: Container(
                height: height*0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Image.file(
                    selectedPhoto!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(onPressed: (){
                _uploadPhoto();
              },
                  child: Text(
                      selectedPhoto == null ? "Add photo" : "Change photo"
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewImage extends StatelessWidget {
  File? image;
  ViewImage({Key? key, this.image}) : super(key: key);
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.file(image!,
        fit: BoxFit.contain,
      ),
    );
  }
}


//
// GestureDetector(
// onHorizontalDragEnd: (details) {
// if (details.primaryVelocity! < 0) {
// // Swiped from left to right (next page)
// _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
// } else if (details.primaryVelocity! > 0) {
// // Swiped from right to left (previous page)
// _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
// }
// },
// child: PageView(
// controller: _pageController,
// children: [Image.file(image!)],
// ),
// )