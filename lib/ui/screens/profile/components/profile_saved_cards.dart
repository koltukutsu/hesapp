import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/order.dart';
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileSavedCards extends StatelessWidget {
  const ProfileSavedCards({Key? key, required this.savedCardsExpanded})
      : super(key: key);

  final bool savedCardsExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(Insets.s),
        ),
      ),
      child: Column(
        children: [
          ProfileExpandableButton(
            title: 'Kayıtlı Kartlarım',
            expanded: savedCardsExpanded,
            toggle: () {
              context.read<ProfileCubit>().toggleSavedCards();
            },
          ),
          FutureBuilder(
            future: context.read<ProfileCubit>().fetchOrderHistory(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Order>> snapshot,
            ) {
              if (snapshot.hasData) {
                return Visibility(
                  visible: savedCardsExpanded,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(); // TODO: Kart öğesi oluşturulacak.
                      },
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
