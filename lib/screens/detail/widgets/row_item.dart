import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({
    super.key,
    required this.theme,
    required this.data,
    required this.label,
    required this.controller,
    this.isDatePicker = false,
  });

  final ThemeData theme;
  final String? data;
  final String label;
  final bool isDatePicker;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: theme.textTheme.bodyLarge,
          ),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(gapPadding: 0.0),
              suffixIcon: isDatePicker ? const Icon(Icons.date_range) : null,
            ),
            textInputAction: TextInputAction.next,
            enabled: isDatePicker == true ? false : true,
          ),
        )
      ],
    );
  }
}
