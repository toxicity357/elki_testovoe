import 'package:elki_testovoe/feature/domain/entities/house_entity.dart';

abstract class HouseRepository {
  Future<List<HouseEnt?>> getCatalog();
}
