import 'package:flutter/material.dart';
import 'package:todo/components/dialogBox.dart';
import 'package:todo/components/todoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _TodoPageState();
}

class _TodoPageState extends State<HomePage> {

  final textController = TextEditingController();

  List toDoList = [
    ["Write Code", false],
  ];

  void checkBoxChanged (bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

void saveNewTask () {
  setState(() {
    toDoList.add([textController.text, false]);
    textController.clear();
  });
  Navigator.of(context).pop();
}

void createNewTask() {
  showDialog(
    context: context, 
    builder: (context) {
      return DialogBox(
        controller: textController,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}