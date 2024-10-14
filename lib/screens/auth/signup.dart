import 'package:flutter/material.dart';
import 'package:fruits_app/components/button_comp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/components/inputcomp.dart';
import 'package:fruits_app/model/database.dart';
import 'package:fruits_app/model/user.dart';
import 'package:fruits_app/screens/auth/login.dart';
import 'package:sqflite/sqflite.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final UserNama = TextEditingController();
  final UserEmail = TextEditingController();
  final UserPassword = TextEditingController();
  final ConfirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper();

  Future<void> saveUser() async {
    if (formKey.currentState?.validate() ?? false) {
      final newUser = Users(
        user: UserEmail.text,
        nama: UserEmail.text,
        email: UserEmail.text,
        pass: UserPassword.text,
      );

      await dbHelper.insertUser(newUser);
      List<Users> allUsers = await dbHelper.getAllUsers();
      allUsers.forEach((user) {
        print('User: ${user.toMap()}');
      });

      await dbHelper.saveUsersToTxt(context);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
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
                    label: "Username",
                    controller: UserEmail,
                  ),
                  const SizedBox(height: 15),
                  InputComp(
                    label: "Password",
                    controller: UserPassword,
                  ),
                  const SizedBox(height: 15),
                  InputComp(
                    label: "Verifikasi Password",
                    controller: ConfirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password tidak boleh kosong";
                      } else if (value != UserPassword.text) {
                        return "Password tidak cocok";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              Column(
                children: [
                  LogBtn(text: "Buat Akun", onPressed: saveUser),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Opacity(
                    opacity: 0.70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah mempunyai Akun?",
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.36,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontFamily: 'Jost',
                              color: Colors.black87,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0.36,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
