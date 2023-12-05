part of 'exception.dart';

class ExceptionMessage {
  final String enMessage;
  final String swMessage;

  const ExceptionMessage({
    required this.enMessage,
    required this.swMessage,
  });
}

const _unknownMessage = ExceptionMessage(
  enMessage: "Unknown error",
  swMessage: "Tatizo limetokea",
);

const _timeoutMessage = ExceptionMessage(
  enMessage: "Please try again when your internet is stable",
  swMessage: "Tafadhali jaribu tena mtandao wako ukiwa thabiti",
);
