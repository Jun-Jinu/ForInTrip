import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: gray1),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: gray6,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(Icons.search, color: gray3),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('This is my page'),
      ),
    );
  }
}
