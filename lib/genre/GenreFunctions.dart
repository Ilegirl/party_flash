import 'dart:async'; // Completer를 사용하기 위해 import

import 'package:flash/global/GlobalState.dart';

import 'Genre.dart';

class GenreFunctions {
  static Completer<void>? _currentCompleter; // 현재 실행 중인 Future를 취소하기 위한 Completer

  static void flashByGenreFunction(GlobalState globalState) {
    // 이전 Completer가 존재한다면 취소
    _currentCompleter?.complete(); // 현재 작업이 완료되었음을 알림
    _currentCompleter = Completer<void>(); // 새로운 Completer 생성

    switch (globalState.currentGenre) {
      case Genre.dance:
        danceWhileMusicPlaying(globalState);
        break;
      case Genre.ballad:
        balladWhileMusicPlaying(globalState);
        break;
      case Genre.edm:
        edmWhileMusicPlaying(globalState);
        break;
      case Genre.none:
        break;
    }
  }

  static void danceWhileMusicPlaying(GlobalState globalState) {
    // 현재 Completer를 Future로 변환하여 Future를 저장
    final Future<void> future = _currentCompleter!.future;

    Future<void> loop() async {
      while (globalState.isMusicPlaying) {
        print("dance");
        await Future.delayed(const Duration(seconds: 1));

        // 완료되지 않은 Future가 있다면 루프 종료
        if (future != _currentCompleter!.future) {
          break;
        }
      }
    }

    loop();
  }

  static void balladWhileMusicPlaying(GlobalState globalState) {
    final Future<void> future = _currentCompleter!.future;

    Future<void> loop() async {
      while (globalState.isMusicPlaying) {
        print("ballad");
        await Future.delayed(const Duration(seconds: 1));
        if (future != _currentCompleter!.future) {
          break;
        }
      }
    }

    loop();
  }

  static void edmWhileMusicPlaying(GlobalState globalState) {
    final Future<void> future = _currentCompleter!.future;

    Future<void> loop() async {
      while (globalState.isMusicPlaying) {
        print("edm");
        await Future.delayed(const Duration(seconds: 1));
        if (future != _currentCompleter!.future) {
          break;
        }
      }
    }

    loop();
  }
}
