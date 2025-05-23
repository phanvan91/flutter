import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DropdownMenu Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownMenu')),
        body: const Center(child: DropdownMenuExample()),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String _selectedCity = 'Hà Nội';

  final List<String> _cities = ['Hà Nội', 'Đà Nẵng', 'Hồ Chí Minh'];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: _selectedCity,

      onSelected: (value) {
        if (value != null) {
          setState(() {
            _selectedCity = value;
          });
        }
      },

      dropdownMenuEntries: _cities.map(
            (city) {
          return DropdownMenuEntry(value: city, label: city);
        },
      ).toList(),
    );
  }
}
