import 'package:flutter/material.dart';
import 'package:todo/components/dialogBox.dart';
import 'package:todo/components/todoTile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _TodoPageState();
}

class _TodoPageState extends State<HomePage> {

  final _myBox = Hive.box('myBox');

  toDoDatabase db = toDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else{
      db.loadData();
    }

    super.initState();
  }

  final textController = TextEditingController();

  void checkBoxChanged (bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

void saveNewTask () {
  setState(() {
    db.toDoList.add([textController.text, false]);
    textController.clear();
  });
  Navigator.of(context).pop();
  db.updateDatabase();
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
  db.updateDatabase();
}

void deleteTask (int index) {
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDatabase();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0501),
        title: Text(
          "Todo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: "ComicSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}