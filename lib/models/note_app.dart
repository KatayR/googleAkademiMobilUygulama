// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final _controller = TextEditingController();
  final String appName = 'Notes';
  // list of to do
  List notesList = [
    ['make tutorial', false],
    ['do exercise', false]
  ];

  // change box tick changes
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      notesList[index][1] = !notesList[index][1];
    });
  }

// saving new task todoList
  void saveNewTask() {
    setState(() {
      notesList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

// creating new task with using floating action button
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete a task
  void deleteTask(int index) {
    setState(() {
      notesList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            createNewTask();
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return ToDoList(
                taskName: notesList[index][0],
                taskCompleted: notesList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index));
          },
        ));
  }
}

class ToDoList extends StatelessWidget {
  final String? taskName;
  final bool? taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoList({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings().mainOutsidePadding,
      child: Container(
        padding: Paddings().containerPadding,
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius:
                BorderRadius.circular(Decorations().containerCounterRadius)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                taskName!,
                style: TextStyle(
                    decoration: taskCompleted!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  final controller;
  final String saveText = 'Save';
  final String cancelText = 'Cancel';
  final String hintText = 'Add a new task';
  VoidCallback onSave;
  VoidCallback onCancel;
  Function(BuildContext)? deleteFunction;
  DialogBox({
    Key? key,
    required this.onSave,
    required this.onCancel,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 92, 24, 104),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              focusNode: FocusNode(),
              autofocus: true,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  text: saveText,
                  onPressed: onSave,
                ),
                ButtonWidget(
                  text: cancelText,
                  onPressed: onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// save cancel button
class ButtonWidget extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  ButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        disabledColor: Colors.black,
        onPressed: onPressed,
        textColor: Colors.white,
        hoverColor: Colors.black,
        child: Text(text),
        color: Theme.of(context).primaryColor);
  }
}

// main colors in the app
class Decorations {
  Color? scaffoldColor = Colors.amber[100];
  Color? checkBoxColor = Colors.black;
  Color? alertWidgetColor = Colors.amber[300];
  Color? appBarColor = Colors.amber[500];
  Color? containerListColor = Colors.amber[500];
  final double containerCounterRadius = 11;
}

class Paddings {
  final EdgeInsets mainOutsidePadding =
      const EdgeInsets.only(top: 25, left: 25, right: 25);
  final EdgeInsets containerPadding = const EdgeInsets.all(25);
}
