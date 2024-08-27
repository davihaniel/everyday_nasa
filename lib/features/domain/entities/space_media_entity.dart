// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SpaceMediaEntity extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String? mediaUrl;

  const SpaceMediaEntity({
    required this.description,
    required this.mediaType,
    required this.title,
    this.mediaUrl,
  });

  SpaceMediaEntity copyWith({
    String? description,
    String? mediaType,
    String? title,
    String? mediaUrl,
  }) {
    return SpaceMediaEntity(
      description: description ?? this.description,
      mediaType: mediaType ?? this.mediaType,
      title: title ?? this.title,
      mediaUrl: mediaUrl ?? this.mediaUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'mediaType': mediaType,
      'title': title,
      'mediaUrl': mediaUrl,
    };
  }

  factory SpaceMediaEntity.fromMap(Map<String, dynamic> map) {
    return SpaceMediaEntity(
      description: map['explanation'] as String,
      mediaType: map['media_type'] as String,
      title: map['title'] as String,
      mediaUrl: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceMediaEntity.fromJson(String source) =>
      SpaceMediaEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [description, mediaType, title, mediaUrl!];
}
