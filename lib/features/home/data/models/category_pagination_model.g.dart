// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPaginationModel _$CategoryPaginationModelFromJson(
  Map<String, dynamic> json,
) => CategoryPaginationModel(
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  pageCount: (json['pageCount'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$CategoryPaginationModelToJson(
  CategoryPaginationModel instance,
) => <String, dynamic>{
  'page': instance.page,
  'pageSize': instance.pageSize,
  'pageCount': instance.pageCount,
  'total': instance.total,
};
