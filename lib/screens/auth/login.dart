import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/components/button_comp.dart';
import 'package:fruits_app/components/inputcomp.dart';
import 'package:fruits_app/components/signgoolgeauth.dart';
import 'package:fruits_app/model/database.dart';
import 'package:fruits_app/screens/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserEmail = TextEditingController();
  final UserPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper();

  Future<void> loginUser() async {
    if (formKey.currentState?.validate() ?? false) {
      final user = await dbHelper.getUserByEmail(UserEmail.text);

      if (user != null && user.pass == UserPassword.text) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(userName: UserEmail.text)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email atau Password Salah!'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F3F4),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(40, 1, 40, 40),
        child: Form(
          key: formKey,
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
                  InputComp(
                    label: "Login",
                    controller: UserEmail,
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InputComp(
                        label: "Password",
                        controller: UserPassword,
                      ),
                      const SizedBox(height: 7),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: const Opacity(
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    child: Opacity(
                      opacity: 0.30,
                      child: Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
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
                  const Column(
                    children: [
                      Text(
                        "Pilih Opsi lain",
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Jost',
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
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
      ),
    );
  }
}
