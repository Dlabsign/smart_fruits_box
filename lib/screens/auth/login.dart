import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/components/button_comp.dart';
import 'package:fruits_app/components/inputcomp.dart';
import 'package:fruits_app/components/signgoolgeauth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 200,
                ),
                const SizedBox(height: 35),
                InputComp(label: "Login"),
                const SizedBox(height: 15),
                InputComp(label: "Password"),
                const SizedBox(height: 7),
                Opacity(
                  opacity: 0.85,
                  child: const Text(
                    "Lupa Password?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Jost',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Opacity(
                    opacity: 0.30,
                    child: Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Pilih Opsi lain",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Jost',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Expanded(child: GoogleBtn()),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(child: PhoneBtn())
                      ],
                    ),
                  ],
                ),
              ],
            ),
            BtnPrimary(buttonText: "Login", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
