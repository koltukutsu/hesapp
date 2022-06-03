import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hesap/data/repository/Order/OrderServices.dart';
import 'package:get_it/get_it.dart';
import 'package:hesap/ui/screens/sepet/order_screen.dart';

import '../../../../data/model/OrdersModel.dart';
import '../../../theme/colors.dart';
import '../../../widgets/sepet_item.dart';
import 'order_footer.dart';

class OrdersList extends StatefulWidget {
  List<OrdersModel> items = [];
  OrdersList(List<OrdersModel> items){
    this.items = items;
  }
  @override
  _OrdersListState createState() => _OrdersListState(items);


}

class _OrdersListState extends State<OrdersList> {
  OrderServices get service => GetIt.I<OrderServices>();
  List<OrdersModel> items = [];

  _OrdersListState(List<OrdersModel> items){
    this.items = items;
  }

  @override
  void initState() {


    super.initState();
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
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      final order = items[index];

      return InkWell(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: AppColors.basketItemBackground.withOpacity(0.1),
          ),
          child: Row(
            children: [
            Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
              value: order.selected,
              onChanged: (bool? value) {
                setState(() {
                  order.selected = value!;
                  _sepetFooterRefresh(context);
                });
              },
          ),
              Container(
                width: 105,
                height: 72,
                //  color: Colors.red,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: NetworkImage(order.image)),
                ),
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(10),
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
                            // TODO: butona tiklandigi vakit getitem ile bulunulan itemin miktari arttirilacak
                            // icon: SvgPicture.asset(
                            //   "assets/images/negative.svg",
                            //   width: 25,
                            //   height: 25,
                            // ),
                            icon: const Icon(Icons.remove_circle_outline_outlined, color: AppColors.primary),
                            onPressed: () {
                              setState(() {
                                if (order.quantity > 0) {
                                  order.quantity--;
                                  _sepetFooterRefresh(context);
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
                            // icon: SvgPicture.asset(
                            //   "assets/images/plus_icon.svg",
                            //   width: 25,
                            //   height: 25,
                            // ),
                            icon: const Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
                            onPressed: () {
                              setState(() {
                                order.quantity++;
                                _sepetFooterRefresh(context);
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

  void _sepetFooterRefresh(BuildContext context) {

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SepetFooter(_calculateTotal()),
        ));
  }

  String _calculateTotal(){
    double total = 0;
    for(var item in items){
      if(item.selected){
        total += item.quantity * item.price;
      }
    }
    return total.toString();
  }


  void _setState() {
    setState(() {});
  }
}
