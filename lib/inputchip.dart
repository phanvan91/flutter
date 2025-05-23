
import 'package:flutter/material.dart';

void main() => runApp(const ChipDemoApp());

class ChipDemoApp extends StatelessWidget {
  const ChipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chip Demo',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Chip Examples')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: ChipExamples(),
        ),
      ),
    );
  }
}

class ChipExamples extends StatefulWidget {
  const ChipExamples({super.key});

  @override
  State<ChipExamples> createState() => _ChipExamplesState();
}

class _ChipExamplesState extends State<ChipExamples> {
  // For ChoiceChip
  String _selectedLanguage = 'Flutter';
  final List<String> _languages = ['Flutter', 'Dart', 'Firebase'];

  // For FilterChip
  final List<String> _fruits = ['Apple', 'Banana', 'Cherry'];
  final Set<String> _selectedFruits = {};

  // For InputChip
  bool _showInputChip = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🔹 Basic Chips:'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: const [
              Chip(label: Text('Flutter')),
              Chip(label: Text('Dart')),
              Chip(label: Text('UI')),
            ],
          ),
          const Divider(height: 32),

          const Text('🔹 ChoiceChip (chọn 1):'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _languages.map((lang) {
              return ChoiceChip(
                label: Text(lang),
                selected: _selectedLanguage == lang,
                onSelected: (selected) {
                  setState(() {
                    _selectedLanguage = lang;
                  });
                },
              );
            }).toList(),
          ),
          Text('Bạn chọn: $_selectedLanguage'),
          const Divider(height: 32),

          const Text('🔹 FilterChip (chọn nhiều):'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _fruits.map((fruit) {
              print(_selectedFruits.contains(fruit));
              return FilterChip(
                label: Text(fruit),
                selected: _selectedFruits.contains(fruit),
                onSelected: (selected) {
                  setState(() {
                    selected
                        ? _selectedFruits.add(fruit)
                        : _selectedFruits.remove(fruit);
                  });
                },
              );
            }).toList(),
          ),
          Text('Bạn chọn: ${_selectedFruits.join(', ')}'),
          const Divider(height: 32),

          const Text('🔹 InputChip (xóa được):'),
          const SizedBox(height: 8),
          if (_showInputChip)
            InputChip(
              avatar: const CircleAvatar(child: Text('A')),
              label: const Text('Alice'),
              onDeleted: () {
                setState(() {
                  _showInputChip = false;
                });
              },
            )
          else
            const Text('Chip đã bị xóa'),
        ],
      ),
    );
  }
}
