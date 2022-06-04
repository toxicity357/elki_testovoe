import 'package:elki_testovoe/feature/domain/entities/house_entity.dart';
import 'package:elki_testovoe/feature/domain/repositories/house_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HouseState extends Equatable {
  const HouseState();

  @override
  List<Object?> get props => [];
}

class HouseLoadingState extends HouseState {
  const HouseLoadingState();
}

class InitialHouseLoadState extends HouseState {
  const InitialHouseLoadState();
}

class HouseLoadSuccess extends HouseState {
  const HouseLoadSuccess({required this.loadedCatalog, required this.type});

  final String type;
  final List<HouseEnt?> loadedCatalog;

  @override
  List<Object?> get props => [loadedCatalog, type];
}

class ErrorState extends HouseState {
  const ErrorState();
}

class HouseCubit extends Cubit<HouseState> {
  HouseCubit(this._houseRepository) : super(const InitialHouseLoadState()) {
    fetchCatalog();
  }

  final HouseRepository _houseRepository;
  List<HouseEnt?> initialLoadedTypes = [];

  Future<void> fetchCatalog() async {
    emit(const HouseLoadingState());
    try {
      final catalogResult = await _houseRepository.getCatalog();
      initialLoadedTypes.addAll(catalogResult);
      emit(HouseLoadSuccess(loadedCatalog: catalogResult, type: 'allHouses'));
    } catch (e, s) {
      emit(const ErrorState());
      print(e.toString());
      print(s.toString());
    }
  }

  void sortHouses(String type) {
    if (type != 'allHouses') {
      List<HouseEnt?> sortedHouseList =
          List.from(initialLoadedTypes.where((e) => e?.type == type).toList());
      emit(HouseLoadSuccess(loadedCatalog: sortedHouseList, type: type));
    } else {
      emit(HouseLoadSuccess(loadedCatalog: initialLoadedTypes, type: type));
    }
  }
}
