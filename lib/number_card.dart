import "package:flutter/material.dart";
import 'const.dart';

class NumberCard extends StatelessWidget {
  const NumberCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.icon})
      : super(key: key);

  final String title;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 100,
      height: 90,
      decoration: cardDecoration,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: cardTitleStyle,
                ),
                const SizedBox(height: 13),
                Text(
                  subTitle,
                  style: cardSubTitleStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
