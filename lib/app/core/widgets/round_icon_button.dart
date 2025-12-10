import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 4,
      constraints: const BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      fillColor: Colors.white.withOpacity(0.08),
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
