// berfungsi sebagai database dummy untuk menampung data para peserta

import 'package:flutter/foundation.dart';
import '../models/participant_model.dart';

class ParticipantProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Participant> _participants = [];

  // database peserta, ditampung dalam list
  List<Participant> get list {
    return [..._participants];
  }

  Participant getParticipantById(int id) {
    return _participants.firstWhere((element) => element.id == id);
  }

  // tambah peserta ke dalam list
  void addParticipant(Participant newParticipant) {
    _participants.add(newParticipant);
    notifyListeners();
  }

  // edit peserta berdasarkan idnya
  void editParticipant(int participantId, Participant newParticipant) {
    // dicari dulu indeks ke berapa
    int idxParticipant = _participants.indexOf(newParticipant);

    // kemudian diubah dengan data peserta baru yang dilemparkan
    _participants[idxParticipant] = newParticipant;
    notifyListeners();
  }
}
