part of 'exception.dart';

class Message {
  final String enMessage;
  final String swMessage;

  const Message({
    required this.enMessage,
    required this.swMessage,
  });

  const Message.notEmpty({
    required String enlabel,
    required String swlabel,
  })  : enMessage = "$enlabel should not be empty",
        swMessage = "$swlabel ni lazima";

  String fromLocale(TemboLocale locale) {
    return locale.isEN ? enMessage : swMessage;
  }

  @override
  String toString() => 'Message(enMessage: $enMessage, swMessage: $swMessage)';
}

const _unknownMessage = Message(
  enMessage: "Unknown error",
  swMessage: "Tatizo limetokea",
);

const _timeoutMessage = Message(
  enMessage: "Please try again when your internet is stable",
  swMessage: "Tafadhali jaribu tena mtandao wako ukiwa thabiti",
);
