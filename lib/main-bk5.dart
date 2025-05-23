import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Widget gốc
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  void _increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterData(
      count: count,
      child: MaterialApp(
        home: HomePage(onIncrement: _increment),
      ),
    );
  }
}


class CounterData extends InheritedWidget {
  final int count;

  const CounterData({
    super.key,
    required this.count,
    required super.child,
  });

  static CounterData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterData>()!;
  }

  @override
  bool updateShouldNotify(CounterData oldWidget) {
    return count != oldWidget.count;
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onIncrement;
  const HomePage({super.key, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedWidget Example')),
      body: const Center(
        child: CounterDisplay(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onIncrement,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterData.of(context).count;

    return Text(
      'Count: $counter',
      style: const TextStyle(fontSize: 32),
    );
  }
}

