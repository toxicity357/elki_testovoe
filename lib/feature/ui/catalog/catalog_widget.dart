import 'package:elki_testovoe/feature/presentation/cubit/house_card_page.dart';
import 'package:elki_testovoe/feature/ui/ui_styles/ui_colors.dart';
import 'package:elki_testovoe/feature/ui/ui_styles/ui_styles.dart';
import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget(
      {Key? key,
      required this.name,
      required this.location,
      required this.type,
      required this.rating,
      required this.review_count,
      required this.images,
      required this.price,
      required this.description})
      : super(key: key);
  final String? name;
  final String? location;
  final String? type;
  final int? rating;
  final int? review_count;
  final List<String>? images;
  final int? price;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HouseCardPage(
                  name: name,
                  location: location,
                  images: images,
                  price: price,
                  description: description))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: UIColors.houseCard,
              boxShadow: [
                BoxShadow(
                  color: UIColors.shadow.withOpacity(0.15),
                  spreadRadius: 0,
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: SizedBox(
                  height: 264,
                  child: images!.isNotEmpty
                      ? Image.network(
                          '${images?.first}',
                          fit: BoxFit.fill,
                          height: 264,
                          width: MediaQuery.of(context).size.width,
                        )
                      : Center(
                          child: Image.asset(
                            height: 264,
                            'assets/no_foto/no_foto.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ),
              Padding(
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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    child: Icon(
                                      Icons.star,
                                      size: 12,
                                      color: rating! >= index
                                          ? UIColors.purple
                                          : UIColors.grey,
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  '($review_count отзывов)',
                                  style: UIStyles.w400s10blck(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                            '${price.toString().replaceAllMapped(RegExp(r"(\d)(?=(\d{3})+(?!\d))"), (match) => "${match.group(0)} ")} ₽',
                            style: UIStyles.w700s19blck()),
                        Text('/сут.', style: UIStyles.w400s14blck()),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
