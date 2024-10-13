import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/components/button_comp.dart';
import 'package:fruits_app/components/inputcomp.dart';
import 'package:fruits_app/components/signgoolgeauth.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F4),
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
                InputComp(label: "Username"),
                const SizedBox(height: 15),
                InputComp(label: "Email"),
                const SizedBox(height: 15),
                InputComp(label: "Password"),
                const SizedBox(height: 15),
                InputComp(label: "Verifikasi Password"),
                const SizedBox(height: 15),
              ],
            ),
            BtnPrimary(buttonText: "Buat Akun", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
