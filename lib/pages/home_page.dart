import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    {"task": "Learn Flutter", "isCompleted": false},
    {"task": "Drink Cofee", "isCompleted": false},
    {"task": "Sleep", "isCompleted": false},
    {"task": "Code with Shaima", "isCompleted": false},
  ];

  final _controller = TextEditingController();

  void checkBoxChanged(int index) {
    setState(
        () => toDoList[index]["isCompleted"] = !toDoList[index]["isCompleted"]);
  }

  void saveNewTask() {
    setState(() {
      toDoList.add({"task": _controller.text, "isCompleted": false});
      _controller.clear();
    });
  }

  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text("Simple Todo"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index]["task"],
              taskCompleted: toDoList[index]["isCompleted"],
              onChanged: (value) => checkBoxChanged(index),
              onDeleteTask: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Add a new todo task",
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            )),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
