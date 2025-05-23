import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Cuộn theo chiều ngang
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  BorderedImage(),
                  Text('Dash 1'),
                ],
              ),
              Column(
                children: [
                  BorderedImage(),
                  Text('Dash 2'),
                ],
              ),
              Column(
                children: [
                  BorderedImage(),
                  Text('Dash 3'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderedImage extends StatelessWidget {
  const BorderedImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent, width: 4),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Image.network(
        'https://picsum.photos/200',
        width: 150,
      ),
    );
  }
}

