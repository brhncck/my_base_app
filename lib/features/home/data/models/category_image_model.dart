import 'package:json_annotation/json_annotation.dart';

part 'category_image_model.g.dart';

@JsonSerializable()
class CategoryImageModel {
  const CategoryImageModel({
    required this.id,
    required this.name,
    required this.width,
    required this.height,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
    this.alternativeText,
    this.caption,
    this.formats,
    this.previewUrl,
    this.providerMetadata,
  });

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryImageModelFromJson(json);

  final int id;
  final String name;
  final String? alternativeText;
  final String? caption;
  final int width;
  final int height;
  final Map<String, dynamic>? formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final String? previewUrl;
  final String provider;
  @JsonKey(name: 'provider_metadata')
  final Map<String, dynamic>? providerMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toJson() => _$CategoryImageModelToJson(this);
}
