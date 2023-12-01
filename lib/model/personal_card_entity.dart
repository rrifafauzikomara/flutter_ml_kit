import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_ml_kit/model/personal_card_model.dart';

class PersonalCardEntity extends Equatable {
  final File filePhoto;
  final PersonalCardModel cardModel;

  const PersonalCardEntity({
    required this.filePhoto,
    required this.cardModel,
  });

  @override
  List<Object?> get props => [filePhoto, cardModel];
}
