import 'package:elki_testovoe/feature/data/mappers/mapper.dart';
import 'package:elki_testovoe/feature/data/models/house_model.dart';
import 'package:elki_testovoe/feature/domain/entities/house_entity.dart';

class HouseMapper extends Mapper<HouseModel, HouseEnt> {
  @override
  HouseEnt? map(HouseModel? entity) {
    return HouseEnt(
        id: entity?.id ?? 0,
        name: entity?.name ?? '',
        location: entity?.location ?? '',
        description: entity?.description ?? '',
        type: entity?.type ?? '',
        rating: entity?.rating ?? 0,
        review_count: entity?.reviewCount ?? 0,
        images: entity?.images ?? [],
        price: entity?.price ?? 0);
  }
}
