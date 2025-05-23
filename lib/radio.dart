import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Radio Button Example')),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: GenderForm(),
        ),
      ),
    );
  }
}

enum Gender { male, female, other }

class GenderForm extends StatefulWidget {
  const GenderForm({super.key});

  @override
  State<GenderForm> createState() => _GenderFormState();
}

class _GenderFormState extends State<GenderForm> {
  Gender? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Chọn giới tính:', style: TextStyle(fontSize: 18)),
        ListTile(
          title: const Text('Nam'),
          leading: Radio<Gender>(
            value: Gender.male,
            groupValue: _selectedGender,
            onChanged: (Gender? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Nữ'),
          leading: Radio<Gender>(
            value: Gender.female,
            groupValue: _selectedGender,
            onChanged: (Gender? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Khác'),
          leading: Radio<Gender>(
            value: Gender.other,
            groupValue: _selectedGender,
            onChanged: (Gender? value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_selectedGender != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Bạn chọn: $_selectedGender')),
              );
            }
          },
          child: const Text('Xác nhận'),
        )
      ],
    );
  }
}
