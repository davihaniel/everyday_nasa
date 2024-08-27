import 'dart:convert';

import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  const SpaceMediaModel(
      {required super.description,
      required super.mediaType,
      required super.title,
      required super.mediaUrl});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "explanation": description,
      "media_type": mediaType,
      "title": title,
      "url": mediaUrl,
    };
  }

  factory SpaceMediaModel.fromMap(Map<String, dynamic> map) {
    return SpaceMediaModel(
      description: map['explanation'] as String,
      mediaType: map['media_type'] as String,
      title: map['title'] as String,
      mediaUrl: map['url'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory SpaceMediaModel.fromJson(String source) =>
      SpaceMediaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
