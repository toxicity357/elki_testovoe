import 'package:equatable/equatable.dart';

class HouseEnt extends Equatable {
  const HouseEnt(
      {required this.id,
      required this.name,
      required this.location,
      required this.description,
      required this.type,
      required this.rating,
      required this.review_count,
      required this.images,
      required this.price});

  final int? id;
  final String? name;
  final String? location;
  final String? description;
  final String? type;
  final int? rating;
  final int? review_count;
  final List<String>? images;
  final int? price;

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        description,
        type,
        rating,
        review_count,
        images,
        price
      ];
}
