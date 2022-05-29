import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/profile/components/profile_text_field.dart';

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
                  context.read<ProfileCubit>().toggleEditMode();
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
