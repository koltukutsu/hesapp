// necessary
import 'package:flutter/material.dart';

class HesapResimliCard extends StatelessWidget {
  const HesapResimliCard(
      {Key? key,
        required this.isim ,
        required this.resim,
        required this.uzaklik,
      })
      : super(key: key);
  final String resim;
  final String isim;
  final int? uzaklik;

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
          SizedBox(
            height: 90,
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                color: Colors.grey,
                child: Text(
                  uzaklik == null ? '' : '${uzaklik.toString()} metre',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}