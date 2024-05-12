import 'dart:async'; // Completer를 사용하기 위해 import

import 'package:flash/global/GlobalState.dart';

import '../component/single/button/FlashFunction.dart';
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

        if (future != _currentCompleter!.future) break;
        if (!globalState.isMusicPlaying) break;
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 1224));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 1836));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 1836));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("dance off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("dance on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("dance off");
      }
    }

    loop();
  }

  static void balladWhileMusicPlaying(GlobalState globalState) {
    final Future<void> future = _currentCompleter!.future;

    Future<void> loop() async {
      while (globalState.isMusicPlaying) {
        if (future != _currentCompleter!.future) break;
        if (!globalState.isMusicPlaying) break;
        FlashFunction.turnOnFlash(); print("ballad on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("ballad off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 1836));
        FlashFunction.turnOnFlash(); print("ballad on");
      }
    }

    loop();
  }

  static void edmWhileMusicPlaying(GlobalState globalState) {
    final Future<void> future = _currentCompleter!.future;

    Future<void> loop() async {
      while (globalState.isMusicPlaying) {
        if (future != _currentCompleter!.future) break;
        if (!globalState.isMusicPlaying) break;
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 1836));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 1836));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 612));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
        FlashFunction.turnOnFlash(); print("edm on");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 600));
        FlashFunction.turnOffFlash(); print("edm off");
        if (!globalState.isMusicPlaying) break;
        await Future.delayed(const Duration(milliseconds: 12));
      }
    }

    loop();
  }
}
