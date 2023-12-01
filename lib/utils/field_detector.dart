import 'package:flutter/material.dart';

mixin FieldDetector {
  static bool checkId(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "nik";
  }

  static bool checkName(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "nama" || text == "nema" || text == "name";
  }

  static bool checkDob(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "lahir" ||
        text == "tempat" ||
        text == "tempatigllahir" ||
        text == "empatgllahir" ||
        text == "tempat/tgl";
  }

  static bool checkGender(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "kelamin" || text == "jenis";
  }

  static bool checkAddress(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "alamat" ||
        text == "lamat" ||
        text == "alaahom" ||
        text == "alama" ||
        text == "alamao" ||
        text == "alamarw";
  }

  static bool checkRtRw(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "rt/rw" || text == "rw " || text == "rt" || text == "rtirw";
  }

  static bool checkKelDesa(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "kel/desa" || text == "helldesa" || text == "kelldesa";
  }

  static bool checkSubDistrict(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "kecamatan" || dataText.contains("kecamatan");
  }

  static bool checkReligion(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "agama" || text == "gama";
  }

  static bool checkStatus(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "kawin" || text == "perkawinan" || text == "perkawinan:";
  }

  static bool checkJob(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "kerja" || text == "pekerjaan";
  }

  static bool checkNationality(String dataText) {
    final text = dataText.toLowerCase().trim();
    return text == "kewarganegaraan" ||
        text == "negaraan" ||
        text == "kewarganegaraan:";
  }

  static bool isInside(Rect? rect, Rect? isInside) {
    if (rect == null) {
      return false;
    }

    if (isInside == null) {
      return false;
    }

    if (rect.center.dy <= isInside.bottom &&
        rect.center.dy >= isInside.top &&
        rect.center.dy >= isInside.right &&
        rect.center.dx <= 650) {
      return true;
    }

    return false;
  }

  static bool isInside3Rect({
    Rect? isThisRect,
    Rect? isInside,
    Rect? andAbove,
  }) {
    if (isThisRect == null) {
      return false;
    }

    if (isInside == null) {
      return false;
    }

    if (andAbove == null) {
      return false;
    }

    if (isThisRect.center.dy <= andAbove.top &&
        isThisRect.center.dy >= isInside.top &&
        isThisRect.center.dx >= isInside.left) {
      return true;
    }

    return false;
  }
}
