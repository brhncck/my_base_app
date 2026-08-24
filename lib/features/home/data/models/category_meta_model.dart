import 'package:json_annotation/json_annotation.dart';
import 'package:my_base_app/features/home/data/models/category_pagination_model.dart';

part 'category_meta_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryMetaModel {
  const CategoryMetaModel({required this.pagination});

  factory CategoryMetaModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMetaModelFromJson(json);

  final CategoryPaginationModel pagination;

  Map<String, dynamic> toJson() => _$CategoryMetaModelToJson(this);
}
