import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:y_t_music/Y_T_Music_app/Provider/Y_T_provider_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {

  Y_T_provider? providerF;
  Y_T_provider? providerT;

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Y_T_provider>(context,listen: false);
    providerT=Provider.of<Y_T_provider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: providerT!.screenList[providerT!.i],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white12,
          type: BottomNavigationBarType.fixed,
          currentIndex: providerT!.i,
          onTap: (value) {
            providerF!.selectScreen(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.explore_outlined),label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.library_music_outlined),label: "Library"),
            BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline_sharp),label: "Upgrade"),
          ],
        ),
      ),
    );
  }
}
