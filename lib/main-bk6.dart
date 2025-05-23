import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ToDoApp()));

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<ToDo> todos = [
    ToDo(description: 'Học Flutter', isComplete: false),
    ToDo(description: 'Làm bài tập', isComplete: true),
    ToDo(description: 'Mua cà phê', isComplete: false),
  ];

  // Hàm callback nhận từ widget con
  void _toggleComplete(int index) {
    debugPrint('🟡 Dữ liệu: ${todos[index]}');
    debugPrint("After: ${todos[index].toggle()}");
    setState(() {
      todos[index] = todos[index].toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo Callback Example')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ToDoItem(
            todo: todos[index],
            onToggle: () => _toggleComplete(index),
          );
        },
      ),
    );
  }
}


class ToDo {
  final String description;
  final bool isComplete;

  ToDo({required this.description, required this.isComplete});

  // Tạo bản copy với trạng thái mới
  ToDo toggle() => ToDo(description: description, isComplete: !isComplete);
}

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final VoidCallback onToggle;

  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.description,
        style: TextStyle(
          decoration: todo.isComplete ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: todo.isComplete,
        onChanged: (_) => onToggle(),
      ),
    );
  }
}
