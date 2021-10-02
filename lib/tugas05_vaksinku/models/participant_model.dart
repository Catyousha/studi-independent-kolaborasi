enum ParticipantGender {
  male,
  female,
}

// identitas peserta dimodelkan dalam bentuk objek
class Participant {
  int? id;
  String? name;
  String? nik;

  //gender peserta berupa ParticipantGender.male atau ParticipantGender.female
  ParticipantGender? gender;
  DateTime? firstVaccineDate;
  DateTime? secondVaccineDate;

  Participant({
    this.id,
    this.name,
    this.nik,
    this.gender = ParticipantGender.male, // gender default
    this.firstVaccineDate,
    this.secondVaccineDate,
  });

  // menampilkan gender peserta dalam string
  String get showParticipantGender {
    return (gender == ParticipantGender.male) ? "Pria" : "Wanita";
  }

  // menampilkan tanggal vaksinasi pertama peserta dalam string
  String get showFirstVaccineDate {
    DateTime? startDate = firstVaccineDate;
    if (startDate == null) {
      return "DD/MM/YYYY";
    } else {
      return "${startDate.day}/${startDate.month}/${startDate.year}";
    }
  }

  // menampilkan tanggal vaksinasi kedua peserta dalam string
  String get showSecondVaccineDate {
    DateTime? startDate = secondVaccineDate;
    if (startDate == null) {
      return "DD/MM/YYYY";
    } else {
      return "${startDate.day}/${startDate.month}/${startDate.year}";
    }
  }
}
