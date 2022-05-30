import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/cubit/profile/profile_cubit.dart';
import 'package:hesap/data/repository/preferences_repository.dart';
import 'package:hesap/ui/screens/profile/components/profile_body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(PreferencesRepository()),
      child: const Scaffold(
        body: ProfileBody(),
      ),
    );
  }
}
