import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "ForInTrip",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFFA300),
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Color(0xFFFFA300),
              size: 30.0,
            ),
            onPressed: null,
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
