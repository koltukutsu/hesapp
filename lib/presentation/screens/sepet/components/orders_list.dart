import 'package:animated_icon_button/animated_icon_button.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/logic/sepet/sepet_cubit.dart';
import 'package:hesap/presentation/theme/insets.dart';
import 'package:like_button/like_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/model/order.dart';
import '../../../theme/colors.dart';
import '../../../widgets/sepet_item.dart';
import 'order_footer.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  void initState() {
    super.initState();
    context.read<SepetCubit>().loadOrders();
  }

  bool changeValue = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SepetCubit, SepetState>(
      builder: (context, state) {
        if (state is SepetSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final order = state.orderList.keys.toList()[index];

                return InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: AppColors.basketItemBackground.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Checkbox(
                            checkColor: Colors.black,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: changeValue,
                            onChanged: (bool? value) {
                              setState(() {
                                changeValue = value!;
                              });
                              /*//setState(() {

                                //_sepetFooterRefresh(context);
                              });*/
                            },
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(Insets.m),
                              // child: CachedNetworkImage(
                              //     imageUrl: order.image,
                              //     width: 121.sp,
                              //     height: 64.75.sp,
                              //     fit: BoxFit.cover,
                              //     progressIndicatorBuilder:
                              //         (context, url, downloadProgress) => const Center(
                              //       child: RefreshProgressIndicator(),
                              //     ))
                      child: RefreshProgressIndicator(),
                                  ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      order.title,
                                      style: const TextStyle(
                                        fontFamily: 'ubuntu',
                                        fontWeight: FontWeight.w900,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${order.price} tl",
                                        style: const TextStyle(
                                          fontFamily: 'ubuntu',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle_outline_outlined,
                                          color: AppColors.primary,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            context
                                                .read<SepetCubit>()
                                                .decrement(order);
                                            context
                                                .read<SepetCubit>()
                                                .decrementTotalSumWithoutEmit();
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 34,
                                        width: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: AppColors.white,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Text(
                                              context
                                                  .watch<SepetCubit>()
                                                  .orderList[order]
                                                  .toString(),
                                              // state.orderList[order].toString(),
                                              style: const TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 19,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      LikeButton(
                                          onTap: (bool isLiked) async {
                                            setState(() {
                                              context
                                                  .read<SepetCubit>()
                                                  .increment(order);
                                              context
                                                  .read<SepetCubit>()
                                                  .incrementTotalSumWithoutEmit();
                                            });
                                            return !isLiked;
                                          },
                                          animationDuration:
                                              const Duration(milliseconds: 500),
                                          size: 36,
                                          likeBuilder: (isLiked) {
                                            return const Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: AppColors.primary);
                                          }),
                                      // IconButton(
                                      //   icon: const Icon(
                                      //       Icons.add_circle_outline_rounded,
                                      //       color: AppColors.primary),
                                      //   onPressed: () {
                                      //     setState(() {
                                      //       context
                                      //           .read<SepetCubit>()
                                      //           .increment(order);
                                      //     });
                                      //   },
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: state.orderList.length,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blueAccent;
  }

  void _sepetFooterRefresh(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SepetFooter(),
        ));
  }
}
