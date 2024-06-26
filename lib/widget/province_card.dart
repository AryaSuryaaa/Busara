import 'package:flutter/material.dart';

class ProvinceCard extends StatelessWidget {
  final String provinceName;
  final String imagePath;

  const ProvinceCard({super.key, required this.provinceName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            imagePath,
            width: 120,
            height: 151,
            fit: BoxFit.cover,

          ),
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            provinceName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),               ],
    );
  }
}