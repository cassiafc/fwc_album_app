import 'dart:convert';

import 'package:flutter/foundation.dart';

class StickerModel {
  final int id;
  final String stickeCode;
  final String stickeName;
  final String stickeNumber;
  final String stickeImage;

  StickerModel({
    required this.id,
    required this.stickeCode,
    required this.stickeName,
    required this.stickeNumber,
    required this.stickeImage
  });

  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'sticke_code': stickeCode,
      'sticke_name' : stickeName,
      'sticke_number': stickeNumber,
      'sticke_image' : stickeImage,
    };
  }
  factory StickerModel.fromMap(Map<String, dynamic> map) {
    return StickerModel(
        id: map ['id'] ?? 0,
        stickeCode: map ['sticke_code'] ?? '',
        stickeName: map ['sticke_name'] ?? '',
        stickeNumber: map ['sticke_number'] ?? '',
        stickeImage: map ['sticke_image'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());

  factory StickerModel.fromJson(String source) =>
      StickerModel.fromMap(json.decode(source));
}

