import 'package:equatable/equatable.dart';
import 'package:flutter_ml_kit/model/personal_card_entity.dart';
import 'package:flutter_ml_kit/utils/view_data.dart';

class ScanState extends Equatable {
  final ViewData<PersonalCardEntity> idCardState;

  const ScanState({required this.idCardState});

  ScanState copyWith({
    ViewData<PersonalCardEntity>? idCardState,
  }) {
    return ScanState(idCardState: idCardState ?? this.idCardState);
  }

  @override
  List<Object?> get props => [idCardState];
}
