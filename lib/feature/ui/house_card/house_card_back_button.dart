import 'package:elki_testovoe/feature/ui/ui_styles/ui_colors.dart';
import 'package:elki_testovoe/feature/ui/ui_styles/ui_styles.dart';
import 'package:flutter/cupertino.dart';

class HouseCardBackButton extends StatelessWidget {
  const HouseCardBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: CupertinoButton(
        color: UIColors.purple,
        borderRadius: const BorderRadius.all(Radius.circular(47)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Назад', style: UIStyles.w700s19wht()),
      ),
    );
  }
}
