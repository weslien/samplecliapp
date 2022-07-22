import 'package:dcli/dcli.dart';

class Logger {
  static void info(String message) {
    print(blue(message, background: AnsiColor.white));
  }

  static void warn(String message) {
    print(orange(message, background: AnsiColor.white));
  }

  static void success(String message) {
    print(white(message, background: AnsiColor.green));
  }
}
