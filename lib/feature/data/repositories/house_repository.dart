import 'dart:convert';
import 'package:elki_testovoe/feature/data/mappers/house_mapper.dart';
import 'package:elki_testovoe/feature/domain/entities/house_entity.dart';
import 'package:elki_testovoe/feature/domain/repositories/house_repository.dart';
import 'package:http/http.dart' as http;

import '../models/house_model.dart';

class HouseRequestFailure implements Exception {}

class HouseRepositoryImpl implements HouseRepository {
  HouseRepositoryImpl(this._houseMapper);

  final HouseMapper _houseMapper;
  static const _baseUrl = 'https://elki.rent';

  @override
  Future<List<HouseEnt?>> getCatalog() async {
    final houseRequest = Uri.parse('$_baseUrl/test/house.json');
    final houseResponse = await http.get(houseRequest);
    final response = (json.decode(houseResponse.body) as List)
        .map((e) => HouseModel.fromJson(e))
        .toList()
        .map((e) => _houseMapper.map(e))
        .toList();

    if (houseResponse.statusCode != 200) {
      throw HouseRequestFailure();

    }
    return response;
  }
}
