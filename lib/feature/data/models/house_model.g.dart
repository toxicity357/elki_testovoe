// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => HouseModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      rating: json['rating'] as int?,
      reviewCount: json['review_count'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: json['price'] as int?,
    );

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'description': instance.description,
      'type': instance.type,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'images': instance.images,
      'price': instance.price,
    };
