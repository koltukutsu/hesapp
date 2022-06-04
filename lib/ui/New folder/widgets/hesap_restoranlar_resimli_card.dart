// necessary
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HesapResimliCard extends StatelessWidget {
  const HesapResimliCard({
    Key? key,
    required this.isim,
    required this.resim,
    required this.uzaklik,
  }) : super(key: key);
  final String resim;
  final String isim;
  final int? uzaklik;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: SizedBox(
        height: 99,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              Image.network(
                resim,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  isim,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                        ),
                      ]),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        uzaklik == null ? '' : '${uzaklik.toString()} metre',
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
