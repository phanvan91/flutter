import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Repository.fetchTodos();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ToDo List')),
        body: ToDoList(items: items),
      ),
    );
  }
}

class ToDoList extends StatelessWidget {

  final List<ToDo> items;

  const ToDoList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, idx) {
        var item = items[idx];
        return Container(
          color: idx % 2 == 0 ? Colors.lightBlue[50] : Colors.transparent,
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.description),
              Text(item.isComplete ? '✓' : '✗'),
            ],
          ),
        );
      },
    );
  }
}

class ToDo {
  final String description;
  final bool isComplete;

  ToDo({required this.description, required this.isComplete});
}

class Repository {
  static List<ToDo> fetchTodos() {
    return [
      ToDo(description: 'Học Flutter', isComplete: false),
      ToDo(description: 'Làm bài tập', isComplete: true),
      ToDo(description: 'Đi siêu thị', isComplete: false),
      ToDo(description: 'Xem phim', isComplete: true),
    ];
  }
}
