import 'package:flutter_ml_kit/utils/normalize_text.dart';

class PersonalCardModel {
  final String id;
  final String name;
  final String dob;
  final String placeOfDob;
  final String gender;
  final String address;
  final String religion;
  final String status;
  final String job;
  final String nationality;

  const PersonalCardModel({
    required this.id,
    required this.name,
    required this.dob,
    required this.placeOfDob,
    required this.gender,
    required this.address,
    required this.religion,
    required this.status,
    required this.job,
    required this.nationality,
  });

  factory PersonalCardModel.from({
    required String id,
    required String name,
    required String dob,
    required String placeOfDob,
    required String gender,
    required String address,
    required String religion,
    required String status,
    required String job,
    required String nationality,
  }) {
    return PersonalCardModel(
      id: NormalizeText.id(id),
      name: NormalizeText.name(name),
      dob: dob,
      placeOfDob: NormalizeText.address(placeOfDob),
      gender: NormalizeText.gender(gender),
      address: NormalizeText.address(address),
      religion: NormalizeText.religion(religion),
      status: NormalizeText.status(status),
      job: NormalizeText.job(job),
      nationality: NormalizeText.nationality(nationality),
    );
  }
}
