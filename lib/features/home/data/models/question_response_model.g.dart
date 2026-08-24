// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseModel _$QuestionResponseModelFromJson(
  Map<String, dynamic> json,
) => QuestionResponseModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  imageUri: json['image_uri'] as String,
  uri: json['uri'] as String,
  order: (json['order'] as num).toInt(),
);

Map<String, dynamic> _$QuestionResponseModelToJson(
  QuestionResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'image_uri': instance.imageUri,
  'uri': instance.uri,
  'order': instance.order,
};
