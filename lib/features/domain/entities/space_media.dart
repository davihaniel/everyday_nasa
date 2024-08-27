// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SpaceMedia extends Equatable {
  final String description;
  final String mediaType;
  final String title;
  final String? mediaUrl;
  
  const SpaceMedia({
    required this.description,
    required this.mediaType,
    required this.title,
    this.mediaUrl,
  });

  SpaceMedia copyWith({
    String? description,
    String? mediaType,
    String? title,
    String? mediaUrl,
  }) {
    return SpaceMedia(
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

  factory SpaceMedia.fromMap(Map<String, dynamic> map) {
    return SpaceMedia(
      description: map['description'] as String,
      mediaType: map['mediaType'] as String,
      title: map['title'] as String,
      mediaUrl: map['mediaUrl'] != null ? map['mediaUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceMedia.fromJson(String source) => SpaceMedia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [description, mediaType, title, mediaUrl!];
}
