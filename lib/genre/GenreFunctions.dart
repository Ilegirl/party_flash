import 'dart:async'; // Completer를 사용하기 위해 import

import 'package:flash/global/GlobalState.dart';

import '../component/single/button/FlashFunction.dart';
import 'Genre.dart';

class GenreFunctions {
  static Completer<void>?
      _currentCompleter; // 현재 실행 중인 Future를 취소하기 위한 Completer
  static double speed = 1.0;
  static void setSpeed(double newSpeed) {
    speed = newSpeed;
  }

  static void flashByGenreFunction(GlobalState globalState) {
    // 이전 Completer가 존재한다면 취소
    _currentCompleter?.complete(); // 현재 작업이 완료되었음을 알림
    _currentCompleter = Completer<void>(); // 새로운 Completer 생성

    if (globalState.currentGenre == Genre.none) {
      return;
    }

    switch (globalState.currentGenre) {
      case Genre.dance:
        _runGenreFunction(globalState, danceWhileMusicPlaying);
        // danceWhileMusicPlaying(globalState);
        break;
      case Genre.ballad:
        _runGenreFunction(globalState, balladWhileMusicPlaying);
        // balladWhileMusicPlaying(globalState);
        break;
      case Genre.edm:
        _runGenreFunction(globalState, edmWhileMusicPlaying);
        // edmWhileMusicPlaying(globalState);
        break;
      case Genre.none:
        break;
    }
  }

  static void _runGenreFunction(
      GlobalState globalState, Function loopFunction) {
    // 현재 Completer를 Future로 변환하여 Future를 저장
    final Future<void> future = _currentCompleter!.future;

    // 루프 실행
    loopFunction(globalState, future);
  }

  static Duration _getAdjustedDuration(int baseMilliseconds) {
    return Duration(milliseconds: (baseMilliseconds / speed).round());
  }

  static void danceWhileMusicPlaying(
      GlobalState globalState, Future<void> future) async {
    while (globalState.isMusicPlaying) {
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
      FlashFunction.turnOnFlash();
      print('dance on');
      await Future.delayed(_getAdjustedDuration(100));
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
      FlashFunction.turnOffFlash();
      print('dance off');
      await Future.delayed(_getAdjustedDuration(400));
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
    }
  }

  static void balladWhileMusicPlaying(
      GlobalState globalState, Future<void> future) async {
    while (globalState.isMusicPlaying) {
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
      FlashFunction.turnOnFlash();
      print('ballad on');
      await Future.delayed(_getAdjustedDuration(200));
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
      FlashFunction.turnOffFlash();
      print('ballad off');
      await Future.delayed(_getAdjustedDuration(800));
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
    }
  }

  static void edmWhileMusicPlaying(
      GlobalState globalState, Future<void> future) async {
    while (globalState.isMusicPlaying) {
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
      FlashFunction.turnOnFlash();
      print('edm on');
      await Future.delayed(_getAdjustedDuration(80));
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
      FlashFunction.turnOffFlash();
      print('edm off');
      await Future.delayed(_getAdjustedDuration(153));
      if (globalState.currentGenre == Genre.none ||
          future != _currentCompleter!.future) break;
    }
  }
}
