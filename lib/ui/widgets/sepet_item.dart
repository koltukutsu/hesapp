import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hesap/ui/theme/colors.dart';
import '../../data/model/OrdersModel.dart';

class OrdersItem extends StatelessWidget {
  final OrdersModel order;

  const OrdersItem({Key? key, required this.order, listenner})
      : assert(order != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            print(order.quantity);
                            order.quantity++;

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
                          onPressed: null,
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
    );
  }
}
