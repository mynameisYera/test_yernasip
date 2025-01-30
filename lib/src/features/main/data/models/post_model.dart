import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required String slug,
    required String url,
    required String title,
    required String content,
    required String image,
    required String thumbnail,
    required String status,
    required String category,
    required String publishedAt,
    required String updatedAt,
    required int userId,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
