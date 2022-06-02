import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/cubit/order/order_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/theme/insets.dart';

import 'components/profile_order_history.dart';
import 'components/profile_saved_cards.dart';
import 'components/profile_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late HesapUser hesapUser;
  String name = "";
  String username = "";
  String email = "";
  String phone = "";

  @override
  void initState() {
    super.initState();
    context.read<CardCubit>().fetchSavedCards();
    context.read<OrderCubit>().fetchOrderHistory();

    hesapUser = context.read<AuthCubit>().getHesapUser()!;
    name = hesapUser.name;
    username = hesapUser.username;
    email = hesapUser.email;
    phone = hesapUser.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        actions: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileSuccessful) {
                return IconButton(
                  icon: Icon(state.isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    context.read<ProfileCubit>().toggleEditMode(
                          updatedHesapUser: HesapUser(
                            id: hesapUser.id,
                            name: name,
                            username: username,
                            email: email,
                            phone: phone,
                          ),
                        );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileSuccessful) {
                    return Column(
                      children: [
                        ProfileTextField(
                          controller: TextEditingController(text: name),
                          label: "Ad Soyadı",
                          enabled: state.isEditing,
                          suffixIcon: const Icon(Icons.person),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        ProfileTextField(
                          controller: TextEditingController(text: username),
                          label: "Kullanıcı Adı",
                          enabled: state.isEditing,
                          suffixIcon: const Icon(Icons.person),
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                        ProfileTextField(
                          controller: TextEditingController(text: email),
                          label: "E-posta Adresi",
                          enabled: state.isEditing,
                          suffixIcon: const Icon(Icons.mail),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        ProfileTextField(
                          controller: TextEditingController(text: phone),
                          label: "Telefon No",
                          enabled: state.isEditing,
                          suffixIcon: const Icon(Icons.phone),
                          onChanged: (value) {
                            phone = value;
                          },
                        ),
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              BlocBuilder<CardCubit, CardState>(
                builder: (context, state) {
                  if (state is CardLoaded) {
                    return ProfileSavedCards(
                      savedCards: state.savedCards,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
              BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  if (state is OrdersLoaded) {
                    return ProfileOrderHistory(
                      orderList: state.orderList,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
