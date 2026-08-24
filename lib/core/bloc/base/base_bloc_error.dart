import 'package:equatable/equatable.dart';

class BaseBlocError extends Equatable implements Exception {
  const BaseBlocError({required this.message, required this.errorCode, this.showErrorWidget = false});

  final String message;
  final String errorCode;
  final bool showErrorWidget;

  BaseBlocError copyWith({String? message, String? errorCode, bool? showErrorWidget, bool? shouldLogout}) {
    return BaseBlocError(
      message: message ?? this.message,
      errorCode: errorCode ?? this.errorCode,
      showErrorWidget: showErrorWidget ?? this.showErrorWidget,
    );
  }

  @override
  List<Object?> get props => [message, errorCode, showErrorWidget];
}
