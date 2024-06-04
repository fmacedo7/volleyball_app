import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldButton extends StatefulWidget {
  final String hintText;
  final bool isNumeric;

  const CustomTextFieldButton({super.key, required this.hintText, required this.isNumeric});

  @override
  State<CustomTextFieldButton> createState() => _CustomTextFieldButtonState();
}

class _CustomTextFieldButtonState extends State<CustomTextFieldButton> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: widget.isNumeric ? TextInputType.number : TextInputType.text,
      inputFormatters: widget.isNumeric ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            _controller.clear();
          },
          icon: const Icon(Icons.clear),
        ),
      ),
    );
  }
}