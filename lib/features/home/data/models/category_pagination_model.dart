import 'package:json_annotation/json_annotation.dart';

part 'category_pagination_model.g.dart';

@JsonSerializable()
class CategoryPaginationModel {
  const CategoryPaginationModel({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory CategoryPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryPaginationModelFromJson(json);

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Map<String, dynamic> toJson() => _$CategoryPaginationModelToJson(this);
}
