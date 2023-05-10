import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:y_t_music/Y_T_Music_app/Provider/Y_T_provider_screen.dart';
import 'package:y_t_music/Y_T_Music_app/View_screen/Home_screen.dart';
import 'package:y_t_music/Y_T_Music_app/View_screen/Play_music_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Y_T_provider(),),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => Home_screen(),
            "play":(context) => Play_screen(),
          },
          theme: ThemeData.dark(),
        ),
      ),
    ),
  );
}