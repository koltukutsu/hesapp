import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/auth/auth_cubit.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/model/hesap_user.dart';
import 'package:hesap/ui/screens/profile/components/profile_expandable_button.dart';
import 'package:hesap/ui/screens/profile/components/profile_text_field.dart';
import 'package:hesap/ui/theme/insets.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  late HesapUser hesapUser;
  String username = "";
  String email = "";
  String phone = "";

  @override
  void initState() {
    super.initState();
    hesapUser = context.read<AuthCubit>().getHesapUser()!;
    username = hesapUser.username;
    email = hesapUser.email;
    phone = hesapUser.phone;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, bool>(
      builder: (context, isEditing) {
        return Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                label: Text(isEditing ? 'Kaydet' : 'Profili Düzenle'),
                icon: Icon(isEditing ? Icons.save : Icons.edit),
                onPressed: () {
                  context.read<ProfileCubit>().toggleEditMode();
                },
              ),
              ProfileTextField(
                controller: TextEditingController(text: ""),
                label: "Ad Soyadı",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.person),
                onChanged: (value) {},
              ),
              ProfileTextField(
                controller: TextEditingController(text: username),
                label: "Kullanıcı Adı",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.person),
                onChanged: (value) {
                  username = value;
                },
              ),
              ProfileTextField(
                controller: TextEditingController(text: email),
                label: "E-posta Adresi",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.mail),
                onChanged: (value) {
                  email = value;
                },
              ),
              ProfileTextField(
                controller: TextEditingController(text: phone),
                label: "Telefon No",
                enabled: isEditing,
                suffixIcon: const Icon(Icons.phone),
                onChanged: (value) {
                  phone = value;
                },
              ),
              const ProfileExpandableButton(
                title: 'Kartlarım',
              ),
              const ProfileExpandableButton(
                title: 'Geçmiş Siparişlerim',
              ),
            ],
          ),
        );
      },
    );
  }
}
