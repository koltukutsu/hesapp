// necessary
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/ui/screens/menu/components/siparis_kart_custom.dart';

// components
import 'package:hesap/ui/widgets/hesap_text_card.dart';

// theme
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';
import 'package:sizer/sizer.dart';

class HesapMiddleSide extends StatefulWidget {
  // TODO: text ve cardin oldugu kisim ScreenSection icine alinabilir.
  const HesapMiddleSide({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Product> data;

  @override
  State<HesapMiddleSide> createState() => _HesapMiddleSideState();
}

class _HesapMiddleSideState extends State<HesapMiddleSide> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(widget.data.length, (index) {
          return Padding(
            padding: EdgeInsets.only(left: 8.0.sp),
            child: Container(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(Insets.m),
              // ),
              // elevation: 0.5,
              //
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(Insets.m),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.gray.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                    offset: const Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 6.sp,
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(Insets.m),
                  //   child: Image.network(
                  //     'https://picsum.photos/250?image=9',
                  //     width: 121.sp,
                  //     height: 64.75.sp,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(Insets.m),
                      child: CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/250?image=9',
                          width: 121.sp,
                          height: 64.75.sp,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => const Center(
                                    child: RefreshProgressIndicator(),
                                  ))),
                  Text(
                    widget.data[index].title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    "${widget.data[index].price.toString()} ₺",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time_outlined),
                            Text(
                              "  ${widget.data[index].duration.toString()} dk",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.primary,
                          child: IconButton(
                              onPressed: () {
                                debugPrint("Pressed");
                                context
                                    .read<SepetCubit>()
                                    .addToCart(widget.data.elementAt(index));
                                context.read<SepetCubit>().incrementTotalSum();
                              },
                              icon: const Icon(
                                Icons.shopping_basket,
                                color: AppColors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.sp,
                  )
                ],
              ),
            ),
          );
        }));

    // HesapOrderCardCustom(
    //   product: data.values.elementAt(index)[innerIndex],
    //   text: data.values.elementAt(index)[innerIndex].title,
    //   durationSiparis:
    //       data.values.elementAt(index)[innerIndex].duration.toString(),
    //   priceSiparis:
    //       data.values.elementAt(index)[innerIndex].price.toString(),
    //   imageSiparisUrl:
    //       data.values.elementAt(index)[innerIndex].image,
    //   fontSize: Insets.l,
    //   textColor: AppColors.darkBackground,
    //   fontWeight: FontWeight.w200,
    //   textAlignment: Alignment.topLeft,
    //   cardColor: AppColors.white,
    //   cardWidth: 500,
    //   cardHeight: 100,
    //   paddingLeft: 0,
    //   marginTop: 0,
    //   marginBottom: 0,
    //   marginLeft: 0,
    //   marginRight: 0,
    //   cardCircularBottomLeft: 0,
    //   cardCircularBottomRight: 0,
    //   cardCircularTopLeft: 0,
    //   cardCircularTopRight: 0,
    //   cardBlurRadius: 0,
    //   cardShadowColorOpacity: 0,
    //   cardSpreadRadius: 0,
    // ),
    //   ),
    // );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: List.generate(
    //     data.length, // kategori uzunluklari kadar
    //     (index) => Column(
    //       children: [
    //         HesapTextCard(
    //           text: data.keys.elementAt(index),
    //           fontSize: Insets.l,
    //           textColor: AppColors.darkBackground,
    //           textAlignment: Alignment.centerLeft,
    //           fontWeight: FontWeight.w600,
    //           cardColor: Colors.grey.shade300,
    //           cardWidth: 500,
    //           cardHeight: 40,
    //           paddingLeft: 15,
    //           marginTop: 0,
    //           marginBottom: 3,
    //           marginLeft: 0,
    //           marginRight: 0,
    //           cardCircularBottomLeft: 0,
    //           cardCircularBottomRight: 0,
    //           cardCircularTopLeft: 0,
    //           cardCircularTopRight: 0,
    //           cardBlurRadius: 0,
    //           cardShadowColorOpacity: 0,
    //           cardSpreadRadius: 0,
    //         ),
    //         GridView.count(
    //           crossAxisCount: 2,
    //           children: List.generate(
    //             data.values.elementAt(index).length,
    //             (innerIndex) => Center(
    //               child: Text(
    //                 'Item $index',
    //                 style: Theme.of(context).textTheme.headlineSmall,
    //               ),
    //             )
    //             // HesapOrderCardCustom(
    //             //   product: data.values.elementAt(index)[innerIndex],
    //             //   text: data.values.elementAt(index)[innerIndex].title,
    //             //   durationSiparis:
    //             //       data.values.elementAt(index)[innerIndex].duration.toString(),
    //             //   priceSiparis:
    //             //       data.values.elementAt(index)[innerIndex].price.toString(),
    //             //   imageSiparisUrl:
    //             //       data.values.elementAt(index)[innerIndex].image,
    //             //   fontSize: Insets.l,
    //             //   textColor: AppColors.darkBackground,
    //             //   fontWeight: FontWeight.w200,
    //             //   textAlignment: Alignment.topLeft,
    //             //   cardColor: AppColors.white,
    //             //   cardWidth: 500,
    //             //   cardHeight: 100,
    //             //   paddingLeft: 0,
    //             //   marginTop: 0,
    //             //   marginBottom: 0,
    //             //   marginLeft: 0,
    //             //   marginRight: 0,
    //             //   cardCircularBottomLeft: 0,
    //             //   cardCircularBottomRight: 0,
    //             //   cardCircularTopLeft: 0,
    //             //   cardCircularTopRight: 0,
    //             //   cardBlurRadius: 0,
    //             //   cardShadowColorOpacity: 0,
    //             //   cardSpreadRadius: 0,
    //             // ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
