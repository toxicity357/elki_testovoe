import 'package:elki_testovoe/feature/ui/ui_styles/ui_colors.dart';
import 'package:elki_testovoe/feature/ui/ui_styles/ui_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/cubit/house_cubit.dart';

class CatalogAppBarButtons extends StatelessWidget {
  const CatalogAppBarButtons({Key? key, required this.compareType})
      : super(key: key);
  final String compareType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 92,
            height: 32,
            child: CupertinoButton(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              borderRadius: const BorderRadius.all(Radius.circular(19.0)),
              color: compareType == 'allHouses'
                  ? UIColors.purple
                  : UIColors.buttons,
              onPressed: () {
                context.read<HouseCubit>().sortHouses('allHouses');
              },
              child: Text(
                'все дома',
                style: compareType == 'allHouses'
                    ? UIStyles.w400s14wht()
                    : UIStyles.w400s14blck(),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 82,
            height: 32,
            child: CupertinoButton(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              borderRadius: const BorderRadius.all(Radius.circular(19.0)),
              color:
                  compareType == 'o-frame' ? UIColors.purple : UIColors.buttons,
              onPressed: () {
                context.read<HouseCubit>().sortHouses('o-frame');
              },
              child: Text(
                'O-frame',
                style: compareType == 'o-frame'
                    ? UIStyles.w400s14wht()
                    : UIStyles.w400s14blck(),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 82,
            height: 32,
            child: CupertinoButton(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
              borderRadius: const BorderRadius.all(Radius.circular(19.0)),
              color:
                  compareType == 'a-frame' ? UIColors.purple : UIColors.buttons,
              onPressed: () {
                context.read<HouseCubit>().sortHouses('a-frame');
              },
              child: Text(
                'A-frame',
                style: compareType == 'a-frame'
                    ? UIStyles.w400s14wht()
                    : UIStyles.w400s14blck(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
