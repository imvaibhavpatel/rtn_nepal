import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  const CommonTitle({super.key, required this.text, this.validation});

  final String text;
  final String? validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 17,
            ),
          ),
          Text(
            validation ?? '',
            style: const TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
