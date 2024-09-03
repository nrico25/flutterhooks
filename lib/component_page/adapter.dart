import 'package:flutter/material.dart';
import 'package:teamhooks/Model/model.dart';
import 'package:teamhooks/widget/myText.dart';
class AdapterList extends StatelessWidget {
  final Model model;
  const AdapterList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: MyText(
          image: model.image,
          nama: model.nama,
          marginLeft: 20,
          widthImage: 50),
    );
  }
}