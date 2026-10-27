import 'package:flutter/material.dart';

import '../home/homescreen.dart';

class CustExploreBottom extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustExploreBottom({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Spacer(),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
