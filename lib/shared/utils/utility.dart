///[Utility] contain method for full log print
class Utility {
  ///[print] full log print
  static void print(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk

    Future.microtask(() =>
        pattern.allMatches(text).forEach((match) => print(match.group(0)!)));
  }
}
