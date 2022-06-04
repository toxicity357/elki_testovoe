import 'package:elki_testovoe/feature/data/mappers/house_mapper.dart';
import 'package:elki_testovoe/feature/data/repositories/house_repository.dart';
import 'package:elki_testovoe/feature/domain/repositories/house_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<Widget> injection(Widget app) async {
//Mappers
  final houseMapper = HouseMapper();

//Repositories
  final houseRepositoryImpl = HouseRepositoryImpl(houseMapper);

  return MultiRepositoryProvider(providers: [
    RepositoryProvider<HouseRepository>(create: (_) => houseRepositoryImpl)
  ], child: app);
}
