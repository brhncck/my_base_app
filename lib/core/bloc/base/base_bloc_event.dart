import 'package:flutter/foundation.dart';

@immutable
abstract class BaseEvent {
  const BaseEvent();
}

@immutable
class ResetError extends BaseEvent {
  const ResetError();
}
