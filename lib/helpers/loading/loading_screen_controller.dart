import 'package:flutter/foundation.dart';

typedef CloseLoadinScreen = bool Function();
typedef UpdateLoadinScreen = bool Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadinScreen close;
  final UpdateLoadinScreen update;

  const LoadingScreenController({required this.close, required this.update});
}
