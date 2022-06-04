import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/sepet/sepet_cubit.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/ui/theme/colors.dart';

class MenuItemCustom extends StatelessWidget {
  const MenuItemCustom({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              product.image,
              height: 96,
              cacheHeight: 96,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${product.duration} dk",
                    style: const TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 12,
                        color: AppColors.gray),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${product.price} TL",
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_box_rounded,
              color: AppColors.primary,
            ),
            iconSize: 36,
            onPressed: () {
              context.read<SepetCubit>().addToCart(product);
            },
          ),
        ],
      ),
    );
  }
}
