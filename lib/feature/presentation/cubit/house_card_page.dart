import 'package:elki_testovoe/feature/ui/house_card/house_card_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../ui/ui_styles/ui_colors.dart';
import '../../ui/ui_styles/ui_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HouseCardPage extends StatelessWidget {
  const HouseCardPage(
      {Key? key,
      required this.name,
      required this.location,
      required this.images,
      required this.price,
      required this.description})
      : super(key: key);
  final String? name;
  final String? location;
  final String? description;
  final List<String>? images;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.background,
      appBar: AppBar(
        toolbarHeight: 52,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: UIColors.background,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: UIColors.background,
        title: Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '$name',
              style: UIStyles.w700s19blck(),
            ),
            TextSpan(text: ' $location', style: UIStyles.w700s19gr()),
          ])),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CarouselSlider.builder(
                itemCount: images!.isEmpty ? 1 : images!.length,
                itemBuilder: (context, index, realIndex) {
                  return images!.isNotEmpty
                      ? Image.network(
                          images![index],
                          fit: BoxFit.fill,
                          height: 296,
                    width: MediaQuery.of(context).size.width,
                        )
                      : Center(
                          child: Image.asset(
                          height: 296,
                          'assets/no_foto/no_foto.png',
                          fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                        ));
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: 264,
                  viewportFraction: 1,
                  autoPlay: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 16, top: 16),
                child: Text(
                  '$description',
                  style: UIStyles.w400s14blck(),
                ),
              ),
            ],
          ),
          Container(

            height: 92,
            decoration: BoxDecoration(color: UIColors.white, boxShadow: [
              BoxShadow(
                color: UIColors.shadow.withOpacity(0.15),
                spreadRadius: 0,
                blurRadius: 16,
                offset: const Offset(0, -9),
              )
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 36, top: 36),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text:
                          '${price.toString().replaceAllMapped(RegExp(r"(\d)(?=(\d{3})+(?!\d))"), (match) => "${match.group(0)} ")} ₽',
                      style: UIStyles.w700s19blck(),
                    ),
                    TextSpan(text: '/сут.', style: UIStyles.w400s14blck()),
                  ])),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 21, bottom: 21, right: 16, left: 10),
                    child: HouseCardBackButton(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
