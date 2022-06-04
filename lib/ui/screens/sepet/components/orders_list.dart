import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/data/repository/Order/OrderServices.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/model/order.dart';
import '../../../theme/colors.dart';
import '../../../widgets/sepet_item.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  @override
  void initState() {
    context.read<SepetCubit>().loadOrders();

    super.initState();
  }

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
                        children: [
                          Container(
                            width: 105,
                            height: 72,
                            //  color: Colors.red,
                            // decoration: BoxDecoration(
                            //   borderRadius:
                            //       const BorderRadius.all(Radius.circular(10)),
                            //   image: DecorationImage(
                            //       image: NetworkImage(order.image)),
                            // ),
                            // alignment: Alignment.bottomCenter,
                            // padding: const EdgeInsets.all(10),
                            // margin: const EdgeInsets.all(20),
                            child: Image.asset("assets/images/kazandibi.jpg"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    order.title,
                                    style: const TextStyle(
                                      fontFamily: 'ubuntu',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${order.price} ₺",
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
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 34,
                                        width: 46,
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
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline_rounded,
                                            color: AppColors.primary),
                                        onPressed: () {
                                          setState(() {
                                            context
                                                .read<SepetCubit>()
                                                .increment(order);

                                          });
                                        },
                                      ),
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
}
