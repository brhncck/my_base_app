// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryImageModel _$CategoryImageModelFromJson(Map<String, dynamic> json) =>
    CategoryImageModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      hash: json['hash'] as String,
      ext: json['ext'] as String,
      mime: json['mime'] as String,
      size: (json['size'] as num).toDouble(),
      url: json['url'] as String,
      provider: json['provider'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      alternativeText: json['alternativeText'] as String?,
      caption: json['caption'] as String?,
      formats: json['formats'] as Map<String, dynamic>?,
      previewUrl: json['previewUrl'] as String?,
      providerMetadata: json['provider_metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CategoryImageModelToJson(CategoryImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'width': instance.width,
      'height': instance.height,
      'formats': instance.formats,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'provider_metadata': instance.providerMetadata,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
