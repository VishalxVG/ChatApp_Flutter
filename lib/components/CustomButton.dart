// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String ButtonText;
  final void Function()? ontap;
  const CustomButton({super.key, required this.ButtonText, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(ButtonText),
        ),
      ),
    );
  }
}
