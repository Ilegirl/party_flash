import 'GenreFunctions.dart';
import '../global/GlobalState.dart';

extension GenreFunctionsExtension on GlobalState {
  // 현재 장르에 따라 적절한 함수 실행
  void executeGenreFunction(GlobalState globalState) {
    GenreFunctions.flashByGenreFunction(globalState);
  }
}