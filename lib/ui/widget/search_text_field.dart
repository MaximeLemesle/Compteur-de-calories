import 'dart:async';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String labelText;

  const SearchTextField(
      {super.key, required this.onChanged, required this.labelText});

  @override
  // ignore: library_private_types_in_public_api
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _searchTimer;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.secondary,
        ),
        labelText: widget.labelText,
        fillColor: Theme.of(context).colorScheme.secondary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      onChanged: (value) {
        if (_searchTimer != null) {
          _searchTimer!.cancel();
        }
        _searchTimer = Timer(
          const Duration(milliseconds: 500),
          () async {
            if (value.length >= 3) {
              widget.onChanged(value);
            }
          },
        );
      },
    );
  }
}
