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
        appBar: AppBar(title: const Text('handle Input')),
        body: MyRichText(),
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'hello mọi người',
          style: DefaultTextStyle
              .of(context)
              .style,
          children: const <TextSpan>[
            TextSpan(
                text: ' bold', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' world!'),
          ]
      ),
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   return RichText(
//     text: TextSpan(
//       text: 'Hello ',
//       style: DefaultTextStyle.of(context).style,
//       children: const <TextSpan>[
//         TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
//         TextSpan(text: ' world!'),
//       ],
//     ),
//   );
// }
