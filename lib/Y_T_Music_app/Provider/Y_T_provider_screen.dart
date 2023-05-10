import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:y_t_music/Y_T_Music_app/Model_class/Song_model.dart';
import 'package:y_t_music/Y_T_Music_app/View_screen/Explore_screen.dart';
import 'package:y_t_music/Y_T_Music_app/View_screen/Home.dart';
import 'package:y_t_music/Y_T_Music_app/View_screen/Library_screen.dart';
import 'package:y_t_music/Y_T_Music_app/View_screen/Upgrade_screen.dart';

class Y_T_provider extends ChangeNotifier {
  int i = 0;

  List screenList = [
    Home(),
    Explore_screen(),
    Library_screen(),
    Upgrade_screen(),
  ];

  void selectScreen(int value) {
    i = value;

    notifyListeners();
  }

  VideoPlayerController? vidioPlayer ;

  void initVideo()
  {
    vidioPlayer=VideoPlayerController.asset("");

  }

  AssetsAudioPlayer? assetsAudioPlayer = AssetsAudioPlayer();
  Duration duration = Duration(seconds: 0);
  bool play = false;

  List<Song_model> songList = [
    Song_model(image: "assets/image/listen_image/m1.jpg", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m2.jpg", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m3.png", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m4.png", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m5.png", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m6.png", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m7.png", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
    Song_model(image: "assets/image/listen_image/m8.png", name: "gori tame manda lidha mohi raj", singarname: "Umesh Barot"),
  ];

  int choiceIndex=0;

  void initAudio() {
    assetsAudioPlayer!.open(
      Playlist(audios: [
        Audio("assets/music/m1.mp3"),
        Audio("assets/music/m2.mp3"),
        Audio("assets/music/m3.mp3"),
        Audio("assets/music/m4.mp3"),
        Audio("assets/music/m5.mp3"),
        Audio("assets/music/m6.mp3"),
        Audio("assets/music/m7.mp3"),
        Audio("assets/music/m8.mp3"),
      ],startIndex: choiceIndex),
      autoStart: false,
      showNotification: true,
    );
    totalduration();
  }

  void totalduration() {
    assetsAudioPlayer!.current.listen((event) {
      duration = event!.audio.duration;
    });
  }

  void playAudio() {
    assetsAudioPlayer!.play();

    notifyListeners();
  }

  void pauseAudio() {
    assetsAudioPlayer!.pause();

    notifyListeners();
  }

  void nextAudio() {
    assetsAudioPlayer?.next();
  }

  void privuseAudio() {
    assetsAudioPlayer!.previous();
  }
}
