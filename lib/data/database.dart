import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  final _myBox = Hive.box('myBox');

  List toDoList = [];

  void createInitialData () {
    toDoList = [
      ["Use Todo App", false]
    ];
  }

  void loadData () {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase () {
    _myBox.put("TODOLIST", toDoList);
  }
}