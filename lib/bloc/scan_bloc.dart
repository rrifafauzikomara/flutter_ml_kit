import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ml_kit/bloc/scan_event.dart';
import 'package:flutter_ml_kit/bloc/scan_state.dart';
import 'package:flutter_ml_kit/model/personal_card_entity.dart';
import 'package:flutter_ml_kit/service/firebase_ml_kit_service.dart';
import 'package:flutter_ml_kit/utils/view_data.dart';
import 'package:image_picker/image_picker.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final FirebaseMLKitService service;

  ScanBloc({required this.service})
      : super(
          ScanState(idCardState: ViewData.initial()),
        ) {
    on<ScanIdCard>(_onScanIdCard);
  }

  Future<File?> _getImage(ImageSource imageSource) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return null;
      return File(image.path);
    } catch (e) {
      return null;
    }
  }

  void _onScanIdCard(
    ScanIdCard event,
    Emitter<ScanState> emit,
  ) async {
    try {
      emit(state.copyWith(idCardState: ViewData.loading(message: 'Loading')));

      final file = await _getImage(ImageSource.gallery);
      if (file == null) {
        emit(state.copyWith(idCardState: ViewData.error(message: 'Error')));
        return;
      }

      final result = await service.scanIdCard(file);
      emit(
        state.copyWith(
          idCardState: ViewData.success(
            data: PersonalCardEntity(
              filePhoto: file,
              cardModel: result,
            ),
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(idCardState: ViewData.error(message: 'Error')));
    }
  }
}
