// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String ButtonText;
  final void Function()? ontap;
  const CustomButton({super.key, required this.ButtonText, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 40,
      width: 100,
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(ButtonText),
      ),
    );
  }
}
