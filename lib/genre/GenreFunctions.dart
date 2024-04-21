import 'package:flash/global/GlobalState.dart';

import 'Genre.dart';

class GenreFunctions {

  static void flashByGenreFunction(GlobalState globalState) {

    Future<void> danceWhileMusicPlaying() async {
      while (globalState.isMusicPlaying) {
        print("dance");
        await Future.delayed(const Duration(seconds: 1));
      }
    }

    Future<void> balladWhileMusicPlaying() async {
      while (globalState.isMusicPlaying) {
        print("ballad");
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    Future<void> edmWhileMusicPlaying() async {
      while (globalState.isMusicPlaying) {
        print("edm");
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    switch (globalState.currentGenre) {
      case Genre.dance:
        danceWhileMusicPlaying();
        break;
      case Genre.ballad:
        balladWhileMusicPlaying();
        print("ballad");
        break;
      case Genre.edm:
        edmWhileMusicPlaying();
        print("edm");
        break;
      case Genre.none:
        break;
    }

  }
}