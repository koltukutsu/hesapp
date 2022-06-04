import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/cubit/order/order_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/widgets/hesap_button_not_flexible.dart';
import 'package:hesap/util/constants.dart';

import 'components/profile_order_history.dart';
import 'components/profile_saved_cards.dart';
import 'components/profile_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSignInSuccessful) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Profil"),
              actions: [
                IconButton(
                  icon: Icon(isEditing ? Icons.save : Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                )
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
                        return Column(
                          children: [
                            ProfileTextField(
                              controller: TextEditingController(
                                text: name,
                              ),
                              label: "Ad Soyadı",
                              enabled: isEditing,
                              suffixIcon: const Icon(Icons.person),
                              onChanged: (value) {
                                name = value;
                              },
                            ),
                            ProfileTextField(
                              controller: TextEditingController(
                                text: username,
                              ),
                              label: "Kullanıcı Adı",
                              enabled: isEditing,
                              suffixIcon: const Icon(Icons.person),
                              onChanged: (value) {
                                username = value;
                              },
                            ),
                            ProfileTextField(
                              controller: TextEditingController(
                                text: email,
                              ),
                              label: "E-posta Adresi",
                              enabled: isEditing,
                              suffixIcon: const Icon(Icons.mail),
                              onChanged: (value) {
                                email = value;
                              },
                            ),
                            ProfileTextField(
                              controller: TextEditingController(
                                text: phone,
                              ),
                              label: "Telefon No",
                              enabled: isEditing,
                              suffixIcon: const Icon(Icons.phone),
                              onChanged: (value) {
                                phone = value;
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: HesapButtonNotFlexible(
                          label: "Kart Ekle",
                          filled: false,
                          onPressed: () {
                            print("basildi");
                          }),
                    ),
                    const ProfileSavedCards(),
                    const ProfileOrderHistory(),
                    TextButton.icon(
                      label: const Text("Çıkış Yap"),
                      icon: const Icon(Icons.exit_to_app_rounded),
                      onPressed: () {
                        context.read<AuthCubit>().signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            ROUTE_BASE, (Route<dynamic> route) => false);
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                child: const Text("Lütfen giriş yapın"),
                onPressed: () {
                  Navigator.pushNamed(context, ROUTE_ON_BOARDING);
                },
              ),
            ),
          );
        }
      },
    );
  }
}
