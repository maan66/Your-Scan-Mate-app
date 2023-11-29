import 'package:flutter/material.dart';

class BtnContainer extends StatelessWidget {

  final String BtnText;
  final IconData icon;
  final Function onTap;


  const BtnContainer({super.key, required this.BtnText, required this.icon, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function(),
      child: Container(
        height: 150, width: 150,
        decoration: BoxDecoration(
            color: Colors.orange.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(-3,3),
              blurRadius: 0,
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.black54,),
            Text(
              BtnText, textAlign: TextAlign.center, style: TextStyle(
              inherit: false,

              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black,
            ),)
          ],
        ),
      ),
    );
  }
}
