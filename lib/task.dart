import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> _tasks = [];

  final TextEditingController _controller = TextEditingController();

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
    _controller.clear();
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].toggleCompletion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add a new task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _addTask(_controller.text);
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(
                    task.title,
                    style: TextStyle(
                      decoration: task.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (value) {
                      _toggleTask(index);
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _removeTask(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }
}
