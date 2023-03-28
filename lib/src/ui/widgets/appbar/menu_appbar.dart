import 'package:flutter/material.dart';
import '../../theme/app_color.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isActionButton;
  final VoidCallback? onActionButtonPressed;

  const MenuAppBar({
    super.key,
    required this.title,
    this.isActionButton,
    this.onActionButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.0,
            color: gray1,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: gray1,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        if (isActionButton == true)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: onActionButtonPressed,
              child: Text(
                'Done',
                style: TextStyle(
                  color: gray1,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
