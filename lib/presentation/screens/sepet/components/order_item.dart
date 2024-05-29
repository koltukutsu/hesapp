import 'package:flutter/material.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/presentation/theme/colors.dart';
import 'package:like_button/like_button.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  final Order order;
  // order.product

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Checkbox(
          checkColor: Colors.white,
          // fillColor: MaterialStateProperty.resolveWith(getColor),
          value: false,
          onChanged: (bool? value) {
            /*//setState(() {

                                //_sepetFooterRefresh(context);
                              });*/
          },
        ),
        SizedBox(
          width: 105,
          height: 72,
          child: Image.asset(""),
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
                    widget.order.product.title,
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
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  children: [
                    Text(
                      "${widget.order.product.title} ₺",
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
                          //   context.read<SepetCubit>().decrement(order); // azaltma
                        });
                      },
                    ),
                    SizedBox(
                      height: 34,
                      width: 46,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.white,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "${widget.order.quantity}",

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
                            // context.read<SepetCubit>().increment(order); // arttirma
                          });
                          return !isLiked;
                        },
                        animationDuration: const Duration(milliseconds: 500),
                        size: 36,
                        likeBuilder: (isLiked) {
                          return const Icon(Icons.add_circle_outline_rounded,
                              color: AppColors.primary);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
