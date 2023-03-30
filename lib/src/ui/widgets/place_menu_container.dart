import 'package:flutter/material.dart';
import 'package:for_in_trip/src/ui/theme/app_color.dart';

class PlaceMenuContainer extends StatelessWidget {
  final String title;
  final List<Widget>? children;

  const PlaceMenuContainer({
    Key? key,
    required this.title,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        border: Border(
          top: BorderSide(width: 1.0, color: gray6),
          bottom: BorderSide(width: 1.5, color: gray6),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ...children!,
          ],
        ),
      ),
    );
  }
}
