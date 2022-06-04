import 'package:elki_testovoe/feature/presentation/cubit/house_cubit.dart';
import 'package:elki_testovoe/feature/ui/catalog/catalog_app_bar_buttons.dart';
import 'package:elki_testovoe/feature/ui/catalog/catalog_widget.dart';
import 'package:elki_testovoe/feature/ui/ui_styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HouseCubit(context.read()),
      child: const _CatalogPageWidget(),
    );
  }
}

class _CatalogPageWidget extends StatelessWidget {
  const _CatalogPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseCubit, HouseState>(builder: (context, state) {
      if (state is HouseLoadSuccess) {
        return Scaffold(
          backgroundColor: UIColors.background,
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 52,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: UIColors.background,
                statusBarIconBrightness: Brightness.dark,
                ),
            elevation: 0,
            backgroundColor: UIColors.background,
            title: CatalogAppBarButtons(compareType: state.type),
          ),
          body: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return CatalogWidget(
                    name: state.loadedCatalog[index]?.name,
                    location: state.loadedCatalog[index]?.location,
                    type: state.loadedCatalog[index]?.type,
                    rating: state.loadedCatalog[index]?.rating,
                    review_count: state.loadedCatalog[index]?.review_count,
                    images: state.loadedCatalog[index]?.images,
                    price: state.loadedCatalog[index]?.price,
                    description: state.loadedCatalog[index]?.description);
              },
              itemCount: state.loadedCatalog.length),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
