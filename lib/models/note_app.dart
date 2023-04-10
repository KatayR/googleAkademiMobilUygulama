// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wvdeneme/models/class_models.dart';
import 'notePreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:ui';

class Notes extends StatefulWidget {
  String title;
  Widget not;
  Notes({Key? key, required this.title, required this.not}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: noteColors.bg,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Text(
          "not argumanı geliyor ama şu an kullanmıyorum",
          style: TextStyle(fontSize: 20),
        ),
      ),
    ));
  }
}
