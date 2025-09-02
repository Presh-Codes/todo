import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function (bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  const TodoTile(
    {
      super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color(0xFF0A0501),
            ),
          ]
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),     
        ),
      ),
    );
  }
}