import 'package:flutter/material.dart';

class DropdownCustom extends StatefulWidget {
  const DropdownCustom({super.key});

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  String? _dropdownValue = '100';

  final List<int> gramValues = List.generate(21, (index) => index * 10);

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: DropdownButton<String>(
        value: _dropdownValue,
        items: gramValues.map((int value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text('$value g'),
          );
        }).toList(),
        onChanged: dropdownCallback,
        icon: Icon(
          Icons.speed_rounded,
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        isExpanded: true,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Theme.of(context).colorScheme.outlineVariant),
        underline: Container(),
      ),
    );
  }
}
