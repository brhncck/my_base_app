import 'package:json_annotation/json_annotation.dart';

part 'question_response_model.g.dart';

@JsonSerializable()
class QuestionResponseModel {
  const QuestionResponseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUri,
    required this.uri,
    required this.order,
  });

  factory QuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseModelFromJson(json);

  static List<QuestionResponseModel> fromJsonList(Object? json) {
    if (json is! List) {
      throw const FormatException('Questions response is not a JSON list.');
    }

    return json
        .map((item) => QuestionResponseModel.fromJson(_asJsonMap(item)))
        .toList();
  }

  final int id;
  final String title;
  final String subtitle;
  @JsonKey(name: 'image_uri')
  final String imageUri;
  final String uri;
  final int order;

  Map<String, dynamic> toJson() => _$QuestionResponseModelToJson(this);

  static Map<String, dynamic> _asJsonMap(Object? value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    throw const FormatException('Question item is not a JSON object.');
  }
}
