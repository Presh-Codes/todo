import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  final _myBox = Hive.box('myBox');

  List toDoList = [];

  void createInitialData () {

  }

  void loadData () {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase () {
    
  }
}