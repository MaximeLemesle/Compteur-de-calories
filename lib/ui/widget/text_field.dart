import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;

  const MyTextField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.secondary,
        ),
        labelText: labelText,
        fillColor: Theme.of(context).colorScheme.secondary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
