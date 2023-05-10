import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:y_t_music/Y_T_Music_app/Provider/Y_T_provider_screen.dart';

class Play_screen extends StatefulWidget {
  const Play_screen({Key? key}) : super(key: key);

  @override
  State<Play_screen> createState() => _Play_screenState();
}

class _Play_screenState extends State<Play_screen> {

  Y_T_provider? providerF;
  Y_T_provider? providerT;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Y_T_provider>(context,listen: false).initAudio();
  }

  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Y_T_provider>(context,listen: false);
    providerT=Provider.of<Y_T_provider>(context,listen: true);

    int index=ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 30,
            color: Colors.white,
          ),
          centerTitle: true,
          title: Container(
            height: 40,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: Colors.white,
            ),
          ),
          actions: [
            Icon(Icons.cast),
            SizedBox(width: 20),
            Icon(
              Icons.more_vert_rounded,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("${providerT!.songList[index].image}"),
                      fit: BoxFit.cover),
                ),
              ),
              //name
              SizedBox(height: 20),
              Container(
                width: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.thumb_down_off_alt_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    Container(
                      width: 50.w,
                      height: 50,
                      child: Text(
                        "${providerT!.songList[index].name}",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              //singar name
              SizedBox(height: 10),
              Text(
                "${providerT!.songList[index].singarname}",
                style: TextStyle(fontSize: 20, color: Colors.white54),
              ),
              //slider
              SizedBox(height: 20),
              PlayerBuilder.currentPosition(
                player: providerF!.assetsAudioPlayer!,
                builder: (context, position) =>  Column(
                  children: [
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white24,
                      max: providerT!.duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) {
                        position=Duration(seconds: value.toInt());
                        providerT!.assetsAudioPlayer!.seek(position);
                      },
                    ),
                    //timer
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${position}"),
                          Text("${providerT!.duration}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //option
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shuffle,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {
                        providerT!.privuseAudio();
                      },
                      icon: Icon(
                        Icons.skip_previous,
                        size: 35,
                      )),
                  FloatingActionButton(
                      backgroundColor: Colors.white38,
                      onPressed: () {
                        if(providerT!.assetsAudioPlayer!.isPlaying.value)
                          {
                            providerF!.pauseAudio();
                          }
                        else
                          {
                            providerF!.playAudio();
                          }
                      },
                      child: providerT!.assetsAudioPlayer!.isPlaying.value?Icon(
                        Icons.pause,
                        size: 35,
                      ):Icon(
                        Icons.play_arrow,
                        size: 35,
                      )),
                  IconButton(
                      onPressed: () {
                        providerT!.nextAudio();
                      },
                      icon: Icon(
                        Icons.skip_next,
                        size: 35,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      )),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white10,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 6,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(52),
                    color: Colors.white38),
              ),
              //option
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "UP NEXT",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "LYRICS",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "RELATED",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
