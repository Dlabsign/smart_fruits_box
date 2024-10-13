import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/components/inputcomp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F4),
        title: const Text(
          "Login",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Jost',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            letterSpacing: 0.24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/logo.svg',
                height: 200,
                color: Colors.black,
              ),
            ),
            Column(
              children: [
                InputComp(label: "Login"),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputComp(label: "Password"),
                    SizedBox(
                      height: 7,
                    ),
                    Opacity(
                      opacity: 0.85,
                      child: Text(
                        "Lupa Password?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Jost',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
