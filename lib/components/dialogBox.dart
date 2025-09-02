import 'package:flutter/material.dart';
import 'package:todo/components/myButtons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
    {
      super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
    }
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepOrangeAccent,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "New Task",
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: "Save", onPressed: onSave),
                const SizedBox(width: 10,),
                MyButtons(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}