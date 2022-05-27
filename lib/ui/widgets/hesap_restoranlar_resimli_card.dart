// necessary
import 'package:flutter/material.dart';

class HesapResimliCard extends StatelessWidget {
  const HesapResimliCard(
      {Key? key,
        required this.isim ,
        required this.resim,
        //required this.uzaklik,
      })
      : super(key: key);
  final String resim;
  final String isim;
  //final int uzaklik;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage(resim),
            height: 99,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: (){

              },
            ),
          ),
          Text(
            isim,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}