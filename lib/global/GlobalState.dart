import 'Genre.dart';

class GlobalState {
  // 현재 장르를 저장하는 private 변수
  Genre _currentGenre = Genre.dance;

  // 음악 재생 상태를 저장하는 private 변수
  bool _isMusicPlaying = false;

  // CurrentGenre 인스턴스를 저장할 private static 변수
  static final GlobalState _instance = GlobalState._internal();

  // 외부에서 인스턴스를 생성하지 못하도록 private constructor를 설정
  GlobalState._internal();

  // 싱글톤 인스턴스에 접근하기 위한 factory 생성자
  factory GlobalState() {
    return _instance;
  }

  // 현재 장르를 가져오는 getter
  Genre get currentGenre => _currentGenre;

  // 현재 장르를 설정하는 setter
  set currentGenre(Genre value) {
    _currentGenre = value;
  }

  // 음악 재생 상태를 가져오는 getter
  bool get isMusicPlaying => _isMusicPlaying;

  // 음악 재생 상태를 설정하는 setter
  set isMusicPlaying(bool value) {
    _isMusicPlaying = value;
  }
}
