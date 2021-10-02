import 'participant_model.dart';

enum FormArgsType {
  add,
  detail,
}

class FormScreenArguments {
  final FormArgsType type;
  final int? participantId;

  FormScreenArguments({
    required this.type,
    this.participantId,
  });
}
