// necessary
import 'package:flutter/material.dart';

class HesapResimliCard extends StatelessWidget {
  const HesapResimliCard(
      {Key? key,
        required this.text ,
        this.imageUrl =
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"})
      : super(key: key);
  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage(imageUrl),
            height: 99,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: (){

              },
            ),
          ),
          Text(
            text,
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