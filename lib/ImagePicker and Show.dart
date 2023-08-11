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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewSingleImage(image: selectedPhoto)));
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

class ViewSingleImage extends StatelessWidget {
  final File? image;
  const ViewSingleImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: InteractiveViewer(
        maxScale: 25,
        child: Image.file(image!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
