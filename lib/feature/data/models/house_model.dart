import 'package:json_annotation/json_annotation.dart';

part 'house_model.g.dart';

enum ReviewCount {
  @JsonValue('review_count')
  reviewCount
}

@JsonSerializable()
class HouseModel {
  HouseModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.description,
      required this.type,
      required this.rating,
      required this.reviewCount,
      required this.images,
      required this.price});

  final int? id;
  final String? name;
  final String? location;
  final String? description;
  final String? type;
  final int? rating;
  final int? reviewCount;
  final List<String>? images;
  final int? price;

  factory HouseModel.fromJson(Object? json) =>
      _$HouseModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$HouseModelToJson(this);
}
