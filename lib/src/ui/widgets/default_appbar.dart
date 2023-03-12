import 'package:flutter/material.dart';
import '../theme/app_color.dart';
import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppbar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "ForInTrip",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          color: grey,
        ),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.notifications), onPressed: null),
      ],
      backgroundColor: transparent,
      elevation: 0,
    );
  }
}
