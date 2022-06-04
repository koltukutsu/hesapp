import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/cubit/order/order_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/theme/insets.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<CardCubit>().fetchSavedCards();
    context.read<OrderCubit>().fetchOrderHistory();
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
                  icon: Icon(context.watch<ProfileCubit>().isEditing
                      ? Icons.save
                      : Icons.edit),
                  onPressed: () {
                    context.read<ProfileCubit>().toggleEditMode();
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
                    Column(
                      children: [
                        ProfileTextField(
                          controller: TextEditingController(
                            text: context.watch<AuthCubit>().hesapUser!.name,
                          ),
                          label: "Ad Soyadı",
                          enabled: context.watch<ProfileCubit>().isEditing,
                          suffixIcon: const Icon(Icons.person),
                          onChanged: (value) {
                            context.read<ProfileCubit>().setName(value);
                          },
                        ),
                        ProfileTextField(
                          controller: TextEditingController(
                            text:
                                context.watch<AuthCubit>().hesapUser!.username,
                          ),
                          label: "Kullanıcı Adı",
                          enabled: context.watch<ProfileCubit>().isEditing,
                          suffixIcon: const Icon(Icons.person),
                          onChanged: (value) {
                            context.read<ProfileCubit>().setUsername(value);
                          },
                        ),
                        ProfileTextField(
                          controller: TextEditingController(
                            text: context.watch<AuthCubit>().hesapUser!.email,
                          ),
                          label: "E-posta Adresi",
                          enabled: context.watch<ProfileCubit>().isEditing,
                          suffixIcon: const Icon(Icons.mail),
                          onChanged: (value) {
                            context.read<ProfileCubit>().setEmail(value);
                          },
                        ),
                        ProfileTextField(
                          controller: TextEditingController(
                              text:
                                  context.watch<AuthCubit>().hesapUser!.phone),
                          label: "Telefon No",
                          enabled: context.watch<ProfileCubit>().isEditing,
                          suffixIcon: const Icon(Icons.phone),
                          onChanged: (value) {
                            context.read<ProfileCubit>().setPhone(value);
                          },
                        ),
                      ],
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
