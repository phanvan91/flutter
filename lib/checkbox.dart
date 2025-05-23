import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Checkbox Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Chọn kỹ năng')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SkillCheckboxList(),
        ),
      ),
    );
  }
}

class SkillCheckboxList extends StatefulWidget {
  const SkillCheckboxList({super.key});

  @override
  State<SkillCheckboxList> createState() => _SkillCheckboxListState();
}

class _SkillCheckboxListState extends State<SkillCheckboxList> {
  final Map<String, bool> _skills = {
    'Flutter': false,
    'Dart': false,
    'Firebase': false,
    'REST API': false,
    'Git': false,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Bạn biết những kỹ năng nào?', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: _skills.entries.map((entry) {
              return CheckboxListTile(
                title: Text(entry.key),
                value: entry.value,
                onChanged: (bool? selected) {
                  setState(() {
                    _skills[entry.key] = selected ?? false;
                  });
                },
              );
            }).toList(),
          ),
        ),
        const Text('Bạn biết những kỹ năng nào?', style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
