import 'package:flutter/material.dart';

class AppBarTrailingButton extends StatelessWidget {
  final Function() onPressed;

  const AppBarTrailingButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.cyan,
            shape: const StadiumBorder(),
          ),
          onPressed: onPressed,
          child: const Text(
            'Save',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 15)
      ],
    );
  }
}
