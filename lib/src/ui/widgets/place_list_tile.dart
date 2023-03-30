import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/theme/app_color.dart';

class PlaceListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;

  const PlaceListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: gray6,
            width: 1.0,
          ),
          bottom: BorderSide(
            color: gray6,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        tileColor: white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        leading: leading,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: subtitle == null
            ? null
            : Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 16.0,
                  color: gray3,
                ),
              ),
        trailing: trailing,
      ),
    );
  }
}
