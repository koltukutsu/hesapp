import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/profile/components/profile_text_field.dart';
import "package:flutter/cupertino.dart";
import 'package:hesap/ui/widgets/hesap_correct_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_error_snack_bar.dart';
import 'package:hesap/ui/widgets/hesap_information_snack_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late HesapUser hesapUser; // TODO: verinin kaydedilmesiyle ilgili problem var!!!

  @override
  void initState() {
    super.initState();
    // hesapUser = context.read<AuthCubit>().getHesapUser()!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, bool>(
        builder: (context, isEditing) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              TextButton.icon(
                label: Text(isEditing ? 'Kaydet' : 'Profili Düzenle'),
                icon: Icon(isEditing ? Icons.save : Icons.edit),
                onPressed: () {
                  if (BlocProvider.of<ProfileCubit>(context).isEditing ==
                      false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Bilgi Değiştirme"),
                        content: const Text(
                            "Bilgilerini Değiştirmek İstiyor musun?"),
                        actions: [
                          TextButton(
                            child: const Text("Hayır"),
                            onPressed: () {
                              // context.read<ProfileCubit>().toggleEditMode();
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(informationSnackbar("Profil Bilgileri Değiştirilmedi"));
                              // buraya eski hallerine getirilmesi icin bir ozellik eklenmesi lazim, ufak bir fonksiyon ile halledilir
                              // TODO: ozelligi eklemeye gerek kalmadi, otomatik olarak halledildi
                            },
                          ),
                          TextButton(
                            child: const Text("Evet"),
                            onPressed: () {
                              context.read<ProfileCubit>().toggleEditMode();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    );
                  } else {
                    context.read<ProfileCubit>().toggleEditMode();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(correctSnackbar("Profil Bilgileri Kaydedildi"));
                  }

                  // context.read<ProfileCubit>().toggleEditMode();
                },
              ),
              ProfileTextField(
                controller: TextEditingController(text: "Mehmet Semih BABACAN"),
                label: "Ad Soyadı",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.person),
                onChanged: (value) {},
              ),
              ProfileTextField(
                controller: TextEditingController(text: "zumruduanka"),
                label: "Kullanıcı Adı",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.person),
                onChanged: (value) {},
              ),
              ProfileTextField(
                controller:
                    TextEditingController(text: "semih@babacan.gmail.com"),
                label: "E-posta Adresi",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.mail),
                onChanged: (value) {},
              ),
              ProfileTextField(
                controller: TextEditingController(text: "0000000"),
                label: "Telefon No",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.phone),
                onChanged: (value) {},
              ),
            ],
          );
        },
      ),
    );
  }
}
