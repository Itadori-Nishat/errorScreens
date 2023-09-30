import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  List<XFile>? _imageFiles = [];

  Future<void> _pickImages() async {
    List<XFile>? selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        _imageFiles = selectedImages;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
            Stack(
              children: [
                SizedBox(
                  height: height*0.3,
                child: Expanded(
                  child: MasonryGridView.count(
                    crossAxisCount: 1,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    scrollDirection: Axis.horizontal,
                    itemCount: _imageFiles?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                ExampleView(image: _imageFiles![index].path,
                                  length: _imageFiles!.length,
                                  )));
                          },
                          child: Image.file(File(_imageFiles![index].path),fit: BoxFit.cover,));
                    },
                  ),
                ),
              ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    child: Text(_imageFiles!.length == 0 ? "" :"${_imageFiles!.length} ",style: TextStyle(
                        fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ExampleView extends StatelessWidget {
  final String image;
  final int length;
  ExampleView({Key? key, required this.image, required this.length,}) : super(key: key);



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
