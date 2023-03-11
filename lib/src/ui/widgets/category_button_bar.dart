import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class CategoryButtonBar extends StatefulWidget {
  @override
  _CategoryButtonBarState createState() => _CategoryButtonBarState();
}

class _CategoryButtonBarState extends State<CategoryButtonBar> {
  int _currentIndex = 0;

  List<String> _buttonTitles = [
    "카테고리 1",
    "카테고리 2",
    "카테고리 3",
    "카테고리 4",
    "카테고리 5",
    "카테고리 6",
    "카테고리 7",
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final categoryButtonWidth = deviceWidth / 5.0;
    final categoryButtonPadding = (deviceWidth - 40.0) / 24.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Container(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _buttonTitles.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 5.0, right: categoryButtonPadding, bottom: 5.0),
              child: SizedBox(
                width: categoryButtonWidth,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Text(
                    _buttonTitles[index],
                    style: TextStyle(
                      color: _currentIndex == index ? white : lightGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: _currentIndex == index ? blue : white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: lightGrey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
