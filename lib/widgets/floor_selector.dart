import 'package:flutter/material.dart';

class FloorSelector extends StatelessWidget {
  final int selectedFloor;
  final ValueChanged<int> onChanged;

  const FloorSelector({
    super.key,
    required this.selectedFloor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedFloor,
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text("Ground Floor"),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text("First Floor"),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text("Second Floor"),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}