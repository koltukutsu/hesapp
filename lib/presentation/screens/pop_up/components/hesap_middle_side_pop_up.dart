// necessary
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesap/logic/qr/qr_cubit.dart';
import 'package:hesap/presentation/widgets/hesap_normal_text.dart';

// components
// import 'package:hesap/ui/widgets/hesap_image_card.dart';
import 'package:hesap/presentation/widgets/hesap_text_card.dart';

// theme
import 'package:hesap/presentation/theme/colors.dart';
import 'package:hesap/presentation/theme/insets.dart';
import 'package:random_avatar/random_avatar.dart';

class HesapMiddleSidePopUp extends StatefulWidget {
  const HesapMiddleSidePopUp({
    Key? key,
    required this.qrStream,
  }) : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> qrStream;

  @override
  State<HesapMiddleSidePopUp> createState() => _HesapMiddleSidePopUpState();
}

class _HesapMiddleSidePopUpState extends State<HesapMiddleSidePopUp> {
  final ScrollController _scrollBarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.qrStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          if (snapshot.data!.size > 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.amountBox,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Masadakiler",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollBarController,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView(
                      controller: _scrollBarController,
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                // Container(
                                //   height: 46,
                                //   width: 46,
                                //   decoration: const BoxDecoration(
                                //     shape: BoxShape.circle,
                                //     color: AppColors.primary,
                                //   ),
                                //   child: randomAvatar(
                                //     data["ismi"],
                                //     height: 50,
                                //     width: 52,
                                //   ),
                                //   // child: const Icon(
                                //   //   Icons.person_rounded,
                                //   //   color: Colors.white,
                                //   // ),
                                //   alignment: Alignment.center,
                                // ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data['ismi'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Transform.scale(
                    scale: 8,
                    child:
                        const Icon(Icons.info_sharp, color: Color(0xffFFC107)),
                  ),
                  const HesapNormalText(
                    paddingTop: 90,
                    text: "Bu Masa boş",
                  ),
                  const HesapNormalText(
                    paddingTop: 25,
                    text: "İlk oturan sen olabilirsin",
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
