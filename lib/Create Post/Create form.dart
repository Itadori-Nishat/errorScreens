import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'CreatePost Class.dart';
import 'ListView.dart';
import 'Preview Page.dart';

class CreatePostForm extends StatefulWidget {
  const CreatePostForm({super.key});

  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _discriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  File? selectedPhoto;

  List<CreateFormClass> cpfc = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Title
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _titleController,
                  validator: (val) {
                    if (val == null || val!.isEmpty) {
                      return 'Please give title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Title"
                  ),
                ),

                ///Description
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: 5,
                  maxLength: 1500,
                  minLines: 1,
                  controller: _discriptionController,
                  validator: (value) {
                    if (value!.length < 5) {
                      return 'Please enter at least 50 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Add description"
                  ),
                ),

                ///Price
                TextFormField(
                  controller: _priceController,
                  validator: (val) {
                    if(val == null || val!.isEmpty) {
                      return "Enter price";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Price (Tk)"
                  ),
                ),
                Center(
                  child: ElevatedButton(onPressed: () {
                    String titlee = _titleController.text.trim();
                    String dess = _discriptionController.text.trim();
                    String pricee = _priceController.text.trim();

                    if(titlee.isNotEmpty && dess.isNotEmpty && pricee.isNotEmpty){
                      setState(() {
                        cpfc.add(CreateFormClass(title: titlee, description: dess, price: pricee));
                        _titleController.clear();
                        _discriptionController.clear();
                        _priceController.clear();
                      });
                    }

                  }, child: Text("Save")),
                ),
                cpfc.isEmpty? Center(child: Text("Nothing found")):
                Expanded(
                  child: ListView.builder(
                    itemCount: cpfc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return post(index);
                    },

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    }
  Widget post(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 ==0 ? Colors.deepPurple : Colors.purple,
          child: Text("${cpfc[index].title[0]}${cpfc[index].title[1]}",style: TextStyle(
            color: Colors.white
          ),),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cpfc[index].title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cpfc[index].description),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(cpfc[index].price),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){

                  },
                      icon: Icon(Icons.edit)
                  ),

                  IconButton(onPressed: (){
                    setState(() {
                      cpfc.removeAt(index);
                    });
                  },
                      icon: Icon(Icons.delete)),
                ],
              )
            ],
          ),
        ),
      ),
    );}
}


