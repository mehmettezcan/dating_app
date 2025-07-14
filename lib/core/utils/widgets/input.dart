import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final bool showSuffixIcon;

  InputWidget({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.showSuffixIcon = false,
    this.controller,
  }) : assert(
         !isPassword || controller != null,
         'Controller must be provided if isPassword is true',
       ),
       assert(hintText.isNotEmpty, 'Hint text cannot be empty');

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    () {
      _isObscured = widget.isPassword;
    }();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscured,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.white70, size: 18),
        suffixIcon:
            widget.isPassword && widget.showSuffixIcon
                ? IconButton(
                  onPressed: () {
                    _isObscured = !_isObscured;
                    setState(() {});
                  },
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white38,
                  ),
                )
                : null,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF1D1D1D),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
