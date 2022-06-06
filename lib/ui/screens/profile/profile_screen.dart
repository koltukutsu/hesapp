import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/card/card_cubit.dart';
import 'package:hesap/cubit/order/order_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/profile/components/profile_card_add.dart';
import 'package:hesap/ui/theme/colors.dart';
import 'package:hesap/ui/theme/insets.dart';
import 'package:hesap/ui/widgets/hesap_button_animated.dart';
import 'package:hesap/ui/widgets/hesap_normal_text.dart';
import 'package:hesap/util/animated_route.dart';
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
    // context.read<CardCubit>().fetchSavedCards();
    context.read<CardCubit>().fetchSavedCardFromSharedPreferences();
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
              backgroundColor: AppColors.primary,
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
                padding: const EdgeInsets.symmetric(
                    vertical: Insets.l, horizontal: Insets.s),
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
                      child: HesapButtonAnimated(
                          label: "Kart Ekle",
                          filled: false,
                          widthRatio: 0.28,
                          onPressed: () {
                            Navigator.push(
                                context,
                                FadeInRoute(
                                    page: const HesapAddCreditCard(),
                                    routeName: ROUTE_CREDIT_CARD_ADD));
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
              child: Column(
                children: const [
                  HesapNormalText(
                    text: "Giriş Ekranına Yönlendiriliyorsunuz",
                  ),
                  SizedBox(
                      width: 50, height: 50, child: CircularProgressIndicator())
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
