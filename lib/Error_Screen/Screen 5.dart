import 'package:flutter/material.dart';



class ScreenFive extends StatefulWidget {
  @override
  _ScreenFiveState createState() => _ScreenFiveState();
}

class _ScreenFiveState extends State<ScreenFive> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  List imageUrls = [
    'https://plus.unsplash.com/premium_photo-1691787288771-460eb2b7c99c?ixlib=rb-4.0'
        '.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=714&q=80',
    'https://images.unsplash.com/photo-1691698139354-201a6b38da1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MH'
        'xwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1691379635079-9f438036ea58?ixlib=rb-4.0.3&ixid'
        '=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
    'https://plus.unsplash.com/premium_photo-1691787288771-460eb2b7c99c?ixlib=rb-4.0'
        '.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=714&q=80',
    'https://images.unsplash.com/photo-1691698139354-201a6b38da1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MH'
        'xwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
    'https://images.unsplash.com/photo-1691379635079-9f438036ea58?ixlib=rb-4.0.3&ixid'
        '=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
  ];

  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              'Image ${currentIndex + 1} of ${imageUrls.length}',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: imageUrls.length,
              onPageChanged: (index) {
                updateIndex(index);
              },
              itemBuilder: (context, index) {
                return SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.network(imageUrls[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
