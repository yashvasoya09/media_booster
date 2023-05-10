import 'package:flutter/material.dart';

class Library_screen extends StatefulWidget {
  const Library_screen({Key? key}) : super(key: key);

  @override
  State<Library_screen> createState() => _Library_screenState();
}

class _Library_screenState extends State<Library_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Library_screen",style: TextStyle(color: Colors.white),),
    );
  }
}
