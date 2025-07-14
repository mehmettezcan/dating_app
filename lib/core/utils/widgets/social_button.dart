import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;

  const SocialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF1D1D1D),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
