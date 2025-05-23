import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterParent(),
    );
  }
}

class CounterParent extends StatefulWidget {
  const CounterParent({super.key});

  @override
  State<CounterParent> createState() => _CounterParentState();
}

class _CounterParentState extends State<CounterParent> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared State via Constructor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCounter(count: count),
            MyCounter(count: count),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCounter extends StatelessWidget {
  final int count;

  const MyCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Count: $count',
      style: const TextStyle(fontSize: 24),
    );
  }
}
