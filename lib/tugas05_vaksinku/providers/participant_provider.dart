// berfungsi sebagai database dummy untuk menampung data para peserta

import 'package:flutter/foundation.dart';
import '../models/participant_model.dart';

class ParticipantProvider with ChangeNotifier {
  // database peserta, ditampung dalam list
  // ignore: prefer_final_fields
  List<Participant> _participants = [
    // Participant(
    //   id: 0,
    //   name: "Awanama Wijaya",
    //   nik: "1234567890ABCDEF",
    //   gender: ParticipantGender.male,
    //   firstVaccineDate: DateTime(2021, 10, 2),
    //   secondVaccineDate: DateTime(2021, 11, 3),
    // ),
  ];

  // database peserta, ditampung dalam list
  List<Participant> get list {
    return [..._participants];
  }

  // mendapatkan objek peserta berdasarkan id
  Participant getParticipantById(int id) {
    return _participants.firstWhere(
      (element) => element.id == id,
      orElse: () => Participant(),
    );
  }

  // tambah peserta ke dalam list
  void addParticipant(Participant newParticipant) {
    _participants.add(newParticipant);
    notifyListeners();
  }

  // edit peserta di dalam list
  void editParticipant(Participant newParticipant) {
    // dicari dulu indeks ke berapa
    int idxParticipant = _participants.indexOf(newParticipant);

    // kalau peserta tidak ditemukan (indeks -1), batalkan
    if (idxParticipant == -1) {
      return;
    }

    // kemudian diubah dengan data peserta baru yang dilemparkan
    _participants[idxParticipant] = newParticipant;
    notifyListeners();
  }

  // menghapus peserta berdasarkan idnya
  void removeParticipant(int participantId) {
    _participants.remove(getParticipantById(participantId));
    notifyListeners();
  }
}
