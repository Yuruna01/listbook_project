import 'package:flutter/material.dart';

class KontenPertama extends StatelessWidget {
  const KontenPertama({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '28 Juni 2023',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Beberapa tips agar laptop kamu bisa tetap adem dan hemat baterai....",
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        )
      ],
    );
  }
}

class KontenKedua extends StatelessWidget {
  const KontenKedua({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '26 Juni 2023',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Laptop atau Komputer Bermasalah? hubungi Team Listbook dan kami akan segera membatu anda dalam semua keluhan tentang Laptop dan Komputer.",
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        )
      ],
    );
  }
}

class KontenKetiga extends StatelessWidget {
  const KontenKetiga({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '25 Juni 2023',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Digital Skill Award hadir kembali!. Persiapkan dirimu dengan semua skill yang akan kamu tampilkan....",
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        )
      ],
    );
  }
}
