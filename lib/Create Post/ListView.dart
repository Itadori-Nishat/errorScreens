import 'package:flutter/material.dart';

import 'CreatePost Class.dart';

class ListViewPage extends StatefulWidget {
  final String? title,price,description;
  const ListViewPage({super.key,
    this.title,
    this.description,
    this.price,
  });

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<CreateFormClass> cpfc = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Column(
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
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
