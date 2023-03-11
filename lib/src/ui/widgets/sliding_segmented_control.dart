import 'package:flutter/cupertino.dart';

class SlidingSegmentedControl extends StatefulWidget {
  final Map<int, Widget> children;
  final Function(int) onValueChanged;

  const SlidingSegmentedControl({
    Key? key,
    required this.children,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  _SlidingSegmentedControlState createState() =>
      _SlidingSegmentedControlState();
}

class _SlidingSegmentedControlState extends State<SlidingSegmentedControl> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl<int>(
      groupValue: _currentValue,
      children: widget.children,
      onValueChanged: (value) {
        setState(() {
          _currentValue = value!;
        });
        widget.onValueChanged(value!);
      },
    );
  }
}
