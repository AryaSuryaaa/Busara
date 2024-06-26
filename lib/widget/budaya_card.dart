import 'package:flutter/material.dart';

class BudayaCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;

  const BudayaCard({super.key, required this.title, required this.subTitle, required this.imagePath});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            child: SizedBox(
                height: 104,
                child: Image.asset(imagePath, fit: BoxFit.cover,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 100,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 100,
                  child: Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}