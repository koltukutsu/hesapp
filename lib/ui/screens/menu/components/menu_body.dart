// necessary
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/masa/masa_cubit.dart';
import 'package:hesap/cubit/menu/menu_cubit.dart';
import 'package:hesap/ui/screens/common_screen_sections/hesap_up_side.dart';
import 'package:hesap/ui/screens/menu/components/hesap_middle_side.dart';
import 'package:hesap/ui/screens/menu/components/menu_header.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:hesap/ui/widgets/hesap_text_card.dart';
import 'package:sizer/sizer.dart';

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

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        if (state is MenuLoaded) {
          debugPrint("ilk kontrol");
          debugPrint(state.menu.toString());
          return SafeArea(
              child: DefaultTabController(
                  length: state.menu.length,
                  child: Column(
                    children: [
                      ButtonsTabBar(
                        // borderColor: AppColors.primary,
                        onTap: (index) {
                          debugPrint("index: $index");
                        },
                        // borderWidth: 2.0,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          border: Border.all(
                            color: AppColors.primary,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.sp)),
                        ),
                        unselectedBorderColor: AppColors.white,
                        unselectedBackgroundColor: AppColors.white,
                        unselectedLabelStyle:
                            const TextStyle(color: AppColors.gray),
                        labelStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),

                        tabs: List.generate(
                          state.menu.length,
                          (index) => Tab(
                            icon: Icon(returnIcons(
                                name: state.menu.keys.elementAt(index)!)),
                            text: state.menu.keys.elementAt(index),
                          ),
                        ),
                      ),
                      Expanded(
                          child: HesapMiddleSide(
                              data:
                                  state.menu.values.elementAt(currentIndex)!)),
                    ],
                  )));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // return const Center(child: CircularProgressIndicator());
      },
    );
  }

  IconData returnIcons({required String name}) {
    if (name == "İçecekler") {
      return Icons.emoji_food_beverage;
    } else {
      return Icons.fastfood;
    }
  }
}
