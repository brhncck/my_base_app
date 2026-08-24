import 'package:json_annotation/json_annotation.dart';
import 'package:my_base_app/features/home/data/models/category_meta_model.dart';
import 'package:my_base_app/features/home/data/models/category_model.dart';

part 'category_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryResponseModel {
  const CategoryResponseModel({required this.data, required this.meta});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseModelFromJson(json);

  factory CategoryResponseModel.fromResponseJson(Object? json) {
    if (json is Map<String, dynamic>) {
      return CategoryResponseModel.fromJson(json);
    }

    if (json is Map) {
      return CategoryResponseModel.fromJson(Map<String, dynamic>.from(json));
    }

    throw const FormatException('Category response is not a JSON object.');
  }

  final List<CategoryModel> data;
  final CategoryMetaModel meta;

  Map<String, dynamic> toJson() => _$CategoryResponseModelToJson(this);
}
