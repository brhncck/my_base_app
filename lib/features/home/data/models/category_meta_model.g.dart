// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMetaModel _$CategoryMetaModelFromJson(Map<String, dynamic> json) =>
    CategoryMetaModel(
      pagination: CategoryPaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CategoryMetaModelToJson(CategoryMetaModel instance) =>
    <String, dynamic>{'pagination': instance.pagination.toJson()};
