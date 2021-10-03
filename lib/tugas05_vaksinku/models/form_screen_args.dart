enum FormArgsType {
  add,
  detail,
}

// sebagai format argumen untuk melemparkan data ke page form
class FormScreenArguments {
  // penentu apakah laman form bersifat menambahkan peserta atau melihat detail peserta
  // FormArgsType.add: tambah peserta
  // FormArgsType.detail: detail peserta
  final FormArgsType type;

  // id peserta
  final int? participantId;

  FormScreenArguments({
    required this.type,
    this.participantId,
  });
}
