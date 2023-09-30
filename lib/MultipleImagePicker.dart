import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImagePicker extends StatefulWidget {
   MultipleImagePicker({Key? key}) : super(key: key);

  @override
  State<MultipleImagePicker> createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
   List<XFile>? _imageFiles = [];

   Future _pickImages() async {
     List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
     if (selectedImages != null && selectedImages.isNotEmpty) {
       setState(() {
         _imageFiles = selectedImages;
       });
     }}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _pickImages();
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(_imageFiles!.length == 0 ? "No Image Selected" :"${_imageFiles!.length} images",style: TextStyle(
              fontSize: 22
            ),),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _imageFiles?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewMultipleImage(image: _imageFiles![index].path,)));
                      },
                      child: Image.file(File(_imageFiles![index].path),fit: BoxFit.cover,));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ViewMultipleImage extends StatelessWidget {
  final String image;
  const ViewMultipleImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: InteractiveViewer(
        maxScale: 25,
        child: Image.file(File(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
