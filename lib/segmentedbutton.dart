import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Chip Examples')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ColorSelector(),
          ),
        ),
      ),
    );
  }
}

enum ColorOption { red, green, black, blue }

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  ColorOption _selected = ColorOption.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton<ColorOption>(
          segments: const <ButtonSegment<ColorOption>>[
            ButtonSegment(value: ColorOption.red, label: Text('Red')),
            ButtonSegment(value: ColorOption.green, label: Text('Green')),
            ButtonSegment(value: ColorOption.black, label: Text('Black')),
            ButtonSegment(value: ColorOption.blue, label: Text('Blue')),
          ],
          selected: <ColorOption>{_selected},
          onSelectionChanged: (Set<ColorOption> newSelection) {
            setState(() {
              _selected = newSelection.first;
            });
          },
        ),
        const SizedBox(height: 20),
        Text('Bạn chọn: $_selected'),
      ],
    );
  }
}
