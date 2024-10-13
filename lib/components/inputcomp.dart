import 'package:flutter/material.dart';

class InputComp extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool pass;

  const InputComp({
    Key? key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.pass = false, // Menggunakan pass sebagai input password
  }) : super(key: key);

  @override
  State<InputComp> createState() => _InputCompState();
}

class _InputCompState extends State<InputComp> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.pass;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(500),
            side: const BorderSide(
                width: 1.2, color: Color.fromARGB(255, 45, 45, 45)),
          ),
        ),
        child: TextFormField(
          validator: widget.validator ??
              (value) {
                if (value!.isEmpty) {
                  return "Field tidak boleh kosong";
                }
                return null;
              },
          controller: widget.controller,
          obscureText: _isObscured,
          obscuringCharacter: "*",
          style: const TextStyle(
            color: Color(0xFF333333),
            fontFamily: 'Jost',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.28,
          ),
          decoration: InputDecoration(
            hintText: widget.label, // Menggunakan label sebagai placeholder
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 41, 41, 41),
              fontFamily: 'Jost',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.35,
            ),
            border: InputBorder.none,
            suffixIcon: widget.pass
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: const Color(0xFF7E7E7E),
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
