import 'package:json_annotation/json_annotation.dart';
import 'package:my_base_app/features/home/data/models/category_image_model.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.title,
    required this.rank,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String title;
  final int rank;
  final CategoryImageModel image;

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
