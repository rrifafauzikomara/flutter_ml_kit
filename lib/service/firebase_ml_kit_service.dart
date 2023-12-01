import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ml_kit/model/personal_card_model.dart';
import 'package:flutter_ml_kit/utils/field_detector.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class FirebaseMLKitService {
  Future<PersonalCardModel> scanIdCard(File file) async {
    TextRecognizer textDetector = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognisedText = await textDetector.processImage(
      InputImage.fromFile(file),
    );

    Rect? idRect;
    Rect? nameRect;
    Rect? addressRect;
    Rect? genderRect;
    Rect? placeOfDobRect;
    Rect? religionRect;
    Rect? statusRect;
    Rect? jobRect;
    Rect? nationalityRect;

    try {
      for (int i = 0; i < recognisedText.blocks.length; i++) {
        for (int j = 0; j < recognisedText.blocks[i].lines.length; j++) {
          for (int k = 0;
              k < recognisedText.blocks[i].lines[j].elements.length;
              k++) {
            final data = recognisedText.blocks[i].lines[j].elements[k];

            if (FieldDetector.checkId(data.text)) {
              idRect = data.boundingBox;
            }

            if (FieldDetector.checkName(data.text)) {
              nameRect = data.boundingBox;
            }

            if (FieldDetector.checkDob(data.text)) {
              placeOfDobRect = data.boundingBox;
            }

            if (FieldDetector.checkGender(data.text)) {
              genderRect = data.boundingBox;
            }

            if (FieldDetector.checkAddress(data.text)) {
              addressRect = data.boundingBox;
            }

            if (FieldDetector.checkReligion(data.text)) {
              religionRect = data.boundingBox;
            }

            if (FieldDetector.checkStatus(data.text)) {
              statusRect = data.boundingBox;
            }

            if (FieldDetector.checkJob(data.text)) {
              jobRect = data.boundingBox;
            }

            if (FieldDetector.checkNationality(data.text)) {
              nationalityRect = data.boundingBox;
            }
          }
        }
      }
    } catch (e) {
      throw Exception("iteration failed");
    }

    String idResult = "";
    String nameResult = "";
    String placeOfDobResult = "";
    String dobResult = "";
    String genderResult = "";
    String addressResult = "";
    String religionResult = "";
    String statusResult = "";
    String jobResult = "";
    String nationalityResult = "";

    try {
      for (int i = 0; i < recognisedText.blocks.length; i++) {
        for (int j = 0; j < recognisedText.blocks[i].lines.length; j++) {
          final data = recognisedText.blocks[i].lines[j];

          if (FieldDetector.isInside(data.boundingBox, idRect)) {
            idResult = "$idResult ${data.text}";
          }

          if (FieldDetector.isInside3Rect(
              isThisRect: data.boundingBox,
              isInside: nameRect,
              andAbove: placeOfDobRect)) {
            if (data.text.toLowerCase() != "nama") {
              nameResult = ("$nameResult ${data.text}").trim();
            }
          }

          if (FieldDetector.isInside(data.boundingBox, placeOfDobRect)) {
            final temp = data.text.replaceAll("Tempat/Tgi Lahir", "");
            placeOfDobResult = temp.substring(0, temp.indexOf(',') + 1);
          }

          if (FieldDetector.isInside(data.boundingBox, placeOfDobRect)) {
            final temp = data.text.replaceAll("Tempat/Tgi Lahir", "");
            final result = temp.substring(0, temp.indexOf(',') + 1);
            if (result.isNotEmpty) {
              dobResult =
                  temp.replaceAll(result, "").replaceAll(":", "").trim();
            }
          }

          if (FieldDetector.isInside(data.boundingBox, genderRect)) {
            genderResult = "$genderResult ${data.text}";
          }

          if (FieldDetector.isInside3Rect(
            isThisRect: data.boundingBox,
            isInside: addressRect,
            andAbove: religionRect,
          )) {
            addressResult = "$addressResult ${data.text}";
          }

          if (FieldDetector.isInside(data.boundingBox, religionRect)) {
            religionResult = "$religionResult ${data.text}";
          }

          if (FieldDetector.isInside(data.boundingBox, statusRect)) {
            statusResult = "$statusResult ${data.text}";
          }

          if (FieldDetector.isInside(data.boundingBox, jobRect)) {
            jobResult = "$jobResult ${data.text}";
          }

          if (FieldDetector.isInside(data.boundingBox, nationalityRect)) {
            nationalityResult = "$nationalityResult ${data.text}";
          }
        }
      }
    } catch (e) {
      throw Exception("iteration failed ");
    }

    return PersonalCardModel.from(
      id: idResult,
      name: nameResult,
      dob: dobResult,
      placeOfDob: placeOfDobResult,
      address: addressResult,
      religion: religionResult,
      status: statusResult,
      job: jobResult,
      nationality: nationalityResult,
      gender: genderResult,
    );
  }
}
