import 'package:flutter/material.dart';

class Explore_screen extends StatefulWidget {
  const Explore_screen({Key? key}) : super(key: key);

  @override
  State<Explore_screen> createState() => _Explore_screenState();
}

class _Explore_screenState extends State<Explore_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Explore",style: TextStyle(color: Colors.white),),
    );
  }
}
