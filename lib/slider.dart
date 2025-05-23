import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Slider Demo')),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: BrightnessSlider(),
        ),
      ),
    );
  }
}

class BrightnessSlider extends StatefulWidget {
  const BrightnessSlider({super.key});

  @override
  State<BrightnessSlider> createState() => _BrightnessSliderState();
}

class _BrightnessSliderState extends State<BrightnessSlider> {
  double _brightness = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Độ sáng:', style: TextStyle(fontSize: 18)),
        Slider(
          value: _brightness,
          min: 0,
          max: 100,
          divisions: 10,
          label: '${_brightness.round()}%',
          onChanged: (value) {
            print('Slider value: $value');
            setState(() {
              _brightness = value;
            });
          },
        ),
        Text('Giá trị hiện tại: ${_brightness.round()}%'),
      ],
    );
  }
}
