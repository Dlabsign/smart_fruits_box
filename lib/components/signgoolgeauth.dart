import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        shadowColor: const Color(0x1E9A9A9A),
      ),
      onPressed: () {
        // Tambahkan logika aksi saat tombol diklik
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icon/google.svg',
            height: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "Google",
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneBtn extends StatelessWidget {
  const PhoneBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        shadowColor: const Color(0x1E9A9A9A),
      ),
      onPressed: () {
        // Tambahkan logika aksi saat tombol diklik
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icon/phone.svg',
            height: 24,
          ),
          const SizedBox(width: 10),
          const Text(
            "Phone",
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
