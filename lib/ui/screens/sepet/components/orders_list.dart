import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/data/repository/Order/OrderServices.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/model/OrdersModel.dart';
import '../../../theme/colors.dart';
import '../../../widgets/sepet_item.dart';

class OrdersList extends StatefulWidget {
  @override
  _OrdersListState createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  OrderServices get service => GetIt.I<OrderServices>();

  List<OrdersModel> items = [];

  @override
  void initState() {
    items = OrderServices.getOrderList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      final order = items[index];

      return InkWell(
          child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColors.basketItemBackground.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Container(
                width: 105,
                height: 72,
                //  color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: NetworkImage(order.image)),
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
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
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Row(
                        children: [
                          Text(
                            order.price.toString(),
                            style: const TextStyle(
                              fontFamily: 'ubuntu',
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            icon: SvgPicture.asset(
                              "assets/images/negative.svg",
                              width: 25,
                              height: 25,
                            ),
                            onPressed: () {
                              setState(() {
                                if (order.quantity > 0) {
                                  order.quantity--;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            height: 34,
                            width: 46,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: AppColors.white,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  order.quantity.toString(),
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
                            icon: SvgPicture.asset(
                              "assets/images/plus_icon.svg",
                              width: 25,
                              height: 25,
                            ),
                            onPressed: () {
                              setState(() {
                                order.quantity++;
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
      ));
    }, childCount: items.length));
  }

  void _setState() {
    setState(() {});
  }
}
