// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/menu/menu_cubit.dart';
import 'package:hesap/data/model/product.dart';
import 'package:hesap/ui/screens/menu/components/menu_item.dart';

class MenuBody extends StatefulWidget {
  // TODO: text ve cardin oldugu kisim ScreenSection icine alinabilir.
  const MenuBody({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  final String restaurantId;

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  void initState() {
    super.initState();
    context.read<MenuCubit>().fetchMenu(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        if (state is MenuLoaded) {
        return ListView(
          children: state.menu.map(
            (Product product) {
              return MenuItemCustom(
                product: product,
              );
            },
          ).toList(),
        );
        }
        else {
        return const Center(child: CircularProgressIndicator());
        }
        // return const Center(child: CircularProgressIndicator());

      },
    );
  }
}
